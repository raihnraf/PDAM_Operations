import 'package:freezed_annotation/freezed_annotation.dart';

part 'damage_report.freezed.dart';

enum DamageType { leak, burst, corrosion, blockage, other }

enum DamageSeverity { low, medium, high, critical }

@freezed
class DamageReport with _$DamageReport {
  const factory DamageReport({
    required String id,
    required String taskId,
    required String reporterName,
    required DamageType damageType,
    required DamageSeverity severity,
    required double latitude,
    required double longitude,
    required String description,
    required DateTime reportedAt,
    @Default([]) List<String> photoPaths,
    @Default(false) bool isSynced,
  }) = _DamageReport;
}
