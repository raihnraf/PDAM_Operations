import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/damage_report.dart';
import '../../domain/repositories/damage_report_repository.dart';
import 'damage_report_state.dart';

class DamageReportCubit extends Cubit<DamageReportState> {
  final DamageReportRepository repository;

  DamageReportCubit(this.repository) : super(DamageReportInitial());

  DamageType _damageType = DamageType.leak;
  DamageSeverity _severity = DamageSeverity.medium;
  String _description = '';
  double _latitude = 0;
  double _longitude = 0;
  String _reporterName = '';
  String _taskId = '';
  final List<String> _photoPaths = [];

  void setDamageType(DamageType type) {
    _damageType = type;
    _emitFormUpdated();
  }

  void setSeverity(DamageSeverity severity) {
    _severity = severity;
    _emitFormUpdated();
  }

  void setDescription(String desc) {
    _description = desc;
    _emitFormUpdated();
  }

  void setLocation(double lat, double lng) {
    _latitude = lat;
    _longitude = lng;
    _emitFormUpdated();
  }

  void setReporterName(String name) {
    _reporterName = name;
    _emitFormUpdated();
  }

  void setTaskId(String id) {
    _taskId = id;
    _emitFormUpdated();
  }

  void addPhoto(String path) {
    _photoPaths.add(path);
    _emitFormUpdated();
  }

  void removePhoto(String path) {
    _photoPaths.remove(path);
    _emitFormUpdated();
  }

  void _emitFormUpdated() {
    if (state is! DamageReportLoading && state is! DamageReportSaved) {
      emit(DamageReportFormUpdated(
        damageType: _damageType,
        severity: _severity,
        description: _description,
        latitude: _latitude,
        longitude: _longitude,
        reporterName: _reporterName,
        taskId: _taskId,
        photoPaths: List.unmodifiable(_photoPaths),
      ));
    }
  }

  DamageType get damageType => _damageType;
  DamageSeverity get severity => _severity;
  String get description => _description;
  double get latitude => _latitude;
  double get longitude => _longitude;
  String get reporterName => _reporterName;
  String get taskId => _taskId;
  List<String> get photoPaths => List.unmodifiable(_photoPaths);

  bool get hasLocation => _latitude != 0 || _longitude != 0;

  String? validate() {
    if (_reporterName.trim().isEmpty) return 'Nama petugas wajib diisi';
    if (_description.trim().isEmpty) return 'Deskripsi kerusakan wajib diisi';
    if (_description.trim().length < 20) return 'Deskripsi minimal 20 karakter';
    if (!hasLocation) return 'Lokasi belum ditentukan';
    return null;
  }

  String? validateStep(int step) {
    return switch (step) {
      0 => _reporterName.trim().isEmpty ? 'Nama petugas wajib diisi' : null,
      1 => null,
      2 => _description.trim().length < 20
          ? (_description.trim().isEmpty ? 'Deskripsi wajib diisi' : 'Deskripsi minimal 20 karakter')
          : null,
      3 => null,
      _ => null,
    };
  }

  Future<void> submitReport() async {
    final validationError = validate();
    if (validationError != null) {
      emit(DamageReportError(validationError));
      return;
    }

    emit(DamageReportLoading());

    final report = DamageReport(
      id: const Uuid().v4(),
      taskId: _taskId,
      reporterName: _reporterName.trim(),
      damageType: _damageType,
      severity: _severity,
      latitude: _latitude,
      longitude: _longitude,
      description: _description.trim(),
      reportedAt: DateTime.now(),
      photoPaths: List.from(_photoPaths),
    );

    final result = await repository.saveReport(report);
    result.fold(
      (failure) => emit(DamageReportError(failure.message)),
      (saved) => emit(DamageReportSaved(saved)),
    );
  }

  void reset() {
    _damageType = DamageType.leak;
    _severity = DamageSeverity.medium;
    _description = '';
    _latitude = 0;
    _longitude = 0;
    _reporterName = '';
    _taskId = '';
    _photoPaths.clear();
    emit(DamageReportInitial());
  }
}
