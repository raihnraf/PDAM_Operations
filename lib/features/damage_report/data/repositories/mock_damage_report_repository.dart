import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/damage_report.dart';
import '../../domain/repositories/damage_report_repository.dart';

class MockDamageReportRepository implements DamageReportRepository {
  static const _key = 'pending_damage_reports';

  @override
  Future<Result<DamageReport>> saveReport(DamageReport report) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final prefs = await SharedPreferences.getInstance();
      final reports = await getPendingReports();
      final list = reports.fold(
        (_) => <DamageReport>[],
        (data) => data,
      );
      list.add(report);
      await prefs.setString(_key, jsonEncode(list.map((r) => _toJson(r)).toList()));
      return Success(report);
    } catch (e) {
      return FailureResult(const Failure('Gagal menyimpan laporan'));
    }
  }

  @override
  Future<Result<List<DamageReport>>> getPendingReports() async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_key);
      if (data == null) return Success([]);
      final jsonList = jsonDecode(data) as List;
      final reports = jsonList.map((j) => _fromJson(j)).toList();
      return Success(reports);
    } catch (e) {
      return FailureResult(const Failure('Gagal membaca laporan'));
    }
  }

  @override
  Future<Result<void>> syncPendingReports() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_key);
      return Success(null);
    } catch (e) {
      return FailureResult(const Failure('Gagal sinkronisasi'));
    }
  }

  Map<String, dynamic> _toJson(DamageReport r) => {
        'id': r.id,
        'taskId': r.taskId,
        'reporterName': r.reporterName,
        'damageType': r.damageType.name,
        'severity': r.severity.name,
        'latitude': r.latitude,
        'longitude': r.longitude,
        'description': r.description,
        'reportedAt': r.reportedAt.toIso8601String(),
        'photoPaths': r.photoPaths,
        'isSynced': r.isSynced,
      };

  DamageReport _fromJson(Map<String, dynamic> j) => DamageReport(
        id: j['id'],
        taskId: j['taskId'],
        reporterName: j['reporterName'],
        damageType: DamageType.values.byName(j['damageType']),
        severity: DamageSeverity.values.byName(j['severity']),
        latitude: j['latitude'],
        longitude: j['longitude'],
        description: j['description'],
        reportedAt: DateTime.parse(j['reportedAt']),
        photoPaths: List<String>.from(j['photoPaths']),
        isSynced: j['isSynced'],
      );
}
