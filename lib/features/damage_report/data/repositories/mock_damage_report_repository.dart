import 'dart:convert';
import '../../../../core/utils/result.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/damage_report.dart';
import '../../domain/repositories/damage_report_repository.dart';

class MockDamageReportRepository implements DamageReportRepository {
  static const _key = 'pending_damage_reports';
  final SecureStorage _secureStorage;

  MockDamageReportRepository({required SecureStorage secureStorage})
      : _secureStorage = secureStorage;

  @override
  Future<Result<DamageReport>> saveReport(DamageReport report) async {
    await Future.delayed(AppDuration.mockSlow);
    try {
      final reports = await getPendingReports();
      final list = reports.fold(
        (_) => <DamageReport>[],
        (data) => data,
      );
      list.add(report);
      await _secureStorage.write(
        key: _key,
        value: jsonEncode(list.map((r) => _toJson(r)).toList()),
      );
      return Success(report);
    } catch (e) {
      return FailureResult(const Failure('Gagal menyimpan laporan'));
    }
  }

  @override
  Future<Result<List<DamageReport>>> getPendingReports() async {
    await Future.delayed(AppDuration.mockNormal);
    try {
      final data = await _secureStorage.read(key: _key);
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
    await Future.delayed(AppDuration.mockSync);
    try {
      await _secureStorage.delete(key: _key);
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
