import 'dart:convert';
import '../../../../core/utils/result.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../../core/constants/constants.dart';
import '../../../damage_report/domain/entities/damage_report.dart';
import '../../../damage_report/domain/entities/damage_report_labels.dart';
import '../../domain/entities/pending_report.dart';
import '../../domain/repositories/sync_repository.dart';

class MockSyncRepository implements SyncRepository {
  final SecureStorage _secureStorage;

  MockSyncRepository({required SecureStorage secureStorage})
      : _secureStorage = secureStorage;

  @override
  Future<Result<List<PendingReport>>> getPendingReports() async {
    await Future.delayed(AppDuration.mockNormal);
    try {
      final data = await _secureStorage.read(key: 'pending_damage_reports');
      if (data == null) return Success(_defaultPendingReports());

      final jsonList = jsonDecode(data) as List;
      final reports = jsonList
          .map((j) => PendingReport(
                id: j['id'] as String,
                type: _parseDamageType(j['damageType'] as String).label,
                title: _buildTitle(j),
                savedAt: DateTime.parse(j['reportedAt'] as String),
              ))
          .toList();

      return Success(reports);
    } catch (e) {
      return const FailureResult(Failure('Gagal membaca data laporan tertunda'));
    }
  }

  @override
  Future<Result<int>> getStorageUsageBytes() async {
    await Future.delayed(AppDuration.mockFast);
    try {
      final allData = await _secureStorage.readAll();
      int total = 0;
      for (final value in allData.values) {
        total += value.length;
      }
      return Success(total);
    } catch (e) {
      return const FailureResult(Failure('Gagal membaca penggunaan penyimpanan'));
    }
  }

  @override
  Future<Result<void>> syncAll() async {
    await Future.delayed(AppDuration.mockSync);
    try {
      await _secureStorage.delete(key: 'pending_damage_reports');
      return Success(null);
    } catch (e) {
      return FailureResult(const Failure('Gagal sinkronisasi data'));
    }
  }

  List<PendingReport> _defaultPendingReports() => [
        PendingReport(
          id: 'DR-001',
          type: 'Kebocoran',
          title: 'Pipa Bocor di Jl. Raya Gubeng No. 42',
          savedAt: DateTime(2026, 4, 24, 14, 32),
        ),
        PendingReport(
          id: 'DR-002',
          type: 'Pipa Pecah',
          title: 'Pipa Utama Pecah - Perumahan PAM Surabaya',
          savedAt: DateTime(2026, 4, 24, 11, 15),
        ),
        PendingReport(
          id: 'DR-003',
          type: 'Korosi',
          title: 'Korosi Parah pada Valve V-8942 Kec. Wonokromo',
          savedAt: DateTime(2026, 4, 23, 16, 45),
        ),
      ];

  DamageType _parseDamageType(String type) {
    return switch (type) {
      'leak' => DamageType.leak,
      'burst' => DamageType.burst,
      'corrosion' => DamageType.corrosion,
      'blockage' => DamageType.blockage,
      _ => DamageType.other,
    };
  }

  String _buildTitle(Map<String, dynamic> j) {
    final desc = j['description'] as String?;
    if (desc != null && desc.isNotEmpty) {
      return desc.length > AppStrings.maxTitlePreviewLength
          ? '${desc.substring(0, AppStrings.maxTitlePreviewLength)}...'
          : desc;
    }
    return 'Laporan #${j['id']}';
  }
}
