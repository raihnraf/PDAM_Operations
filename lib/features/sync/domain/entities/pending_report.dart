import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../damage_report/domain/entities/damage_report.dart';

part 'pending_report.freezed.dart';

@freezed
class PendingReport with _$PendingReport {
  const factory PendingReport({
    required String id,
    required DamageType type,
    required String title,
    required DateTime savedAt,
  }) = _PendingReport;
}
