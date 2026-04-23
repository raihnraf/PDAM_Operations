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

  void setDamageType(DamageType type) => _damageType = type;
  void setSeverity(DamageSeverity severity) => _severity = severity;
  void setDescription(String desc) => _description = desc;
  void setLocation(double lat, double lng) {
    _latitude = lat;
    _longitude = lng;
  }
  void setReporterName(String name) => _reporterName = name;
  void setTaskId(String id) => _taskId = id;
  void addPhoto(String path) => _photoPaths.add(path);
  void removePhoto(String path) => _photoPaths.remove(path);

  DamageType get damageType => _damageType;
  DamageSeverity get severity => _severity;

  String? validate() {
    if (_reporterName.trim().isEmpty) return 'Nama petugas wajib diisi';
    if (_description.trim().isEmpty) return 'Deskripsi kerusakan wajib diisi';
    if (_description.trim().length < 20) return 'Deskripsi minimal 20 karakter';
    if (_latitude == 0 && _longitude == 0) return 'Lokasi belum ditentukan';
    return null;
  }

  Future<void> submitReport() async {
    final validationError = validate();
    if (validationError != null) {
      emit(DamageReportError(validationError));
      return;
    }

    emit(DamageReportSaving());

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
