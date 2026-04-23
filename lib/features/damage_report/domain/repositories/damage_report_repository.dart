import '../../../../core/utils/result.dart';
import '../entities/damage_report.dart';

abstract class DamageReportRepository {
  Future<Result<DamageReport>> saveReport(DamageReport report);
  Future<Result<List<DamageReport>>> getPendingReports();
  Future<Result<void>> syncPendingReports();
}
