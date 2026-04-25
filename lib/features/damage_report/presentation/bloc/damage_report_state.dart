import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/damage_report.dart';

part 'damage_report_state.freezed.dart';

@freezed
class DamageReportState with _$DamageReportState {
  const factory DamageReportState.initial() = DamageReportInitial;
  const factory DamageReportState.loading() = DamageReportLoading;
  const factory DamageReportState.formUpdated({
    required DamageType damageType,
    required DamageSeverity severity,
    required String description,
    required double? latitude,
    required double? longitude,
    required String reporterName,
    required String taskId,
    required List<String> photoPaths,
    @Default(0) int currentStep,
  }) = DamageReportFormUpdated;
  const factory DamageReportState.saved(DamageReport report) = DamageReportSaved;
  const factory DamageReportState.error(String message) = DamageReportError;
}
