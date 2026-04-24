import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/pending_report.dart';
import '../../domain/repositories/sync_repository.dart';

class MockSyncRepository implements SyncRepository {
  @override
  Future<Result<List<PendingReport>>> getPendingReports() async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString('pending_damage_reports');
      if (data == null) return Success(_defaultPendingReports());

      final jsonList = jsonDecode(data) as List;
      final reports = jsonList
          .map((j) => PendingReport(
                id: j['id'] as String,
                type: _mapDamageTypeToLabel(j['damageType'] as String),
                title: _buildTitle(j),
                savedAt: DateTime.parse(j['reportedAt'] as String),
              ))
          .toList();

      return Success(reports);
    } catch (e) {
      return Success(_defaultPendingReports());
    }
  }

  @override
  Future<Result<int>> getStorageUsageBytes() async {
    await Future.delayed(const Duration(milliseconds: 100));
    try {
      final prefs = await SharedPreferences.getInstance();
      int total = 0;
      for (final key in prefs.getKeys()) {
        final value = prefs.getString(key);
        if (value != null) {
          total += value.length;
        }
      }
      return Success(total);
    } catch (e) {
      return Success(0);
    }
  }

  @override
  Future<Result<void>> syncAll() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('pending_damage_reports');
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

  String _mapDamageTypeToLabel(String type) {
    switch (type) {
      case 'leak':
        return 'Kebocoran';
      case 'burst':
        return 'Pipa Pecah';
      case 'corrosion':
        return 'Korosi';
      case 'blockage':
        return 'Penyumbatan';
      case 'other':
        return 'Lainnya';
      default:
        return 'Laporan Inspeksi';
    }
  }

  String _buildTitle(Map<String, dynamic> j) {
    final desc = j['description'] as String?;
    if (desc != null && desc.isNotEmpty) {
      return desc.length > 50 ? '${desc.substring(0, 50)}...' : desc;
    }
    return 'Laporan #${j['id']}';
  }
}
