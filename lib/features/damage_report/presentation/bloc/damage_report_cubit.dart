import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/damage_report.dart';
import '../../domain/repositories/damage_report_repository.dart';
import 'damage_report_state.dart';

class DamageReportCubit extends Cubit<DamageReportState> {
  final DamageReportRepository repository;

  DamageReportCubit(this.repository) : super(const DamageReportState.initial());

  void setDamageType(DamageType type) {
    _emitIfForm((s) => s.copyWith(damageType: type));
  }

  void setSeverity(DamageSeverity severity) {
    _emitIfForm((s) => s.copyWith(severity: severity));
  }

  void setDescription(String desc) {
    _emitIfForm((s) => s.copyWith(description: desc));
  }

  void setLocation(double lat, double lng) {
    _emitIfForm((s) => s.copyWith(latitude: lat, longitude: lng));
  }

  void setReporterName(String name) {
    _emitIfForm((s) => s.copyWith(reporterName: name));
  }

  void setTaskId(String id) {
    _emitIfForm((s) => s.copyWith(taskId: id));
  }

  void addPhoto(String path) {
    _emitIfForm((s) {
      final updated = List<String>.from(s.photoPaths)..add(path);
      return s.copyWith(photoPaths: updated);
    });
  }

  void removePhoto(String path) {
    _emitIfForm((s) {
      final updated = List<String>.from(s.photoPaths)..remove(path);
      return s.copyWith(photoPaths: updated);
    });
  }

  void goToNextStep() {
    _emitIfForm((s) => s.copyWith(currentStep: s.currentStep + 1));
  }

  void goToPrevStep() {
    _emitIfForm((s) => s.copyWith(currentStep: s.currentStep - 1));
  }

  void goToStep(int step) {
    _emitIfForm((s) => s.copyWith(currentStep: step));
  }

  void _emitIfForm(DamageReportFormUpdated Function(DamageReportFormUpdated s) update) {
    if (state is DamageReportFormUpdated) {
      emit(update(state as DamageReportFormUpdated));
    } else if (state is DamageReportInitial) {
      emit(update(const DamageReportFormUpdated(
        damageType: DamageType.leak,
        severity: DamageSeverity.medium,
        description: '',
        latitude: null,
        longitude: null,
        reporterName: '',
        taskId: '',
        photoPaths: [],
      )));
    }
  }

  DamageType get damageType {
    final s = state;
    return s is DamageReportFormUpdated ? s.damageType : DamageType.leak;
  }

  DamageSeverity get severity {
    final s = state;
    return s is DamageReportFormUpdated ? s.severity : DamageSeverity.medium;
  }

  String get description {
    final s = state;
    return s is DamageReportFormUpdated ? s.description : '';
  }

  double? get latitude {
    final s = state;
    return s is DamageReportFormUpdated ? s.latitude : null;
  }

  double? get longitude {
    final s = state;
    return s is DamageReportFormUpdated ? s.longitude : null;
  }

  String get reporterName {
    final s = state;
    return s is DamageReportFormUpdated ? s.reporterName : '';
  }

  String get taskId {
    final s = state;
    return s is DamageReportFormUpdated ? s.taskId : '';
  }

  List<String> get photoPaths {
    final s = state;
    return s is DamageReportFormUpdated ? s.photoPaths : [];
  }

  int get currentStep {
    final s = state;
    return s is DamageReportFormUpdated ? s.currentStep : 0;
  }

  bool get hasLocation => latitude != null && longitude != null;

  String? validate() {
    if (reporterName.trim().isEmpty) return 'Nama petugas wajib diisi';
    if (description.trim().isEmpty) return 'Deskripsi kerusakan wajib diisi';
    if (description.trim().length < 20) return 'Deskripsi minimal 20 karakter';
    if (!hasLocation) return 'Lokasi belum ditentukan';
    return null;
  }

  String? validateStep(int step) {
    return switch (step) {
      0 => reporterName.trim().isEmpty ? 'Nama petugas wajib diisi' : null,
      1 => null,
      2 => description.trim().length < 20
          ? (description.trim().isEmpty ? 'Deskripsi wajib diisi' : 'Deskripsi minimal 20 karakter')
          : null,
      3 => null,
      _ => null,
    };
  }

  Future<void> submitReport() async {
    final validationError = validate();
    if (validationError != null) {
      emit(DamageReportState.error(validationError));
      return;
    }

    final formState = state as DamageReportFormUpdated;

    emit(const DamageReportState.loading());

    final report = DamageReport(
      id: const Uuid().v4(),
      taskId: formState.taskId,
      reporterName: formState.reporterName.trim(),
      damageType: formState.damageType,
      severity: formState.severity,
      latitude: formState.latitude!,
      longitude: formState.longitude!,
      description: formState.description.trim(),
      reportedAt: DateTime.now(),
      photoPaths: List.from(formState.photoPaths),
    );

    final result = await repository.saveReport(report);
    result.fold(
      (failure) => emit(DamageReportState.error(failure.message)),
      (saved) => emit(DamageReportState.saved(saved)),
    );
  }

  void reset() {
    emit(const DamageReportState.initial());
  }

  void clearError() {
    if (state is DamageReportError) {
      emit(const DamageReportState.initial());
    }
  }
}
