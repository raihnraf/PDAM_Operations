import '../../../../core/utils/result.dart';
import '../entities/pending_report.dart';

abstract class SyncRepository {
  Future<Result<List<PendingReport>>> getPendingReports();
  Future<Result<int>> getStorageUsageBytes();
  Future<Result<void>> syncAll();
}
