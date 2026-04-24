import 'package:flutter_test/flutter_test.dart';
import 'package:pdam_fields/features/damage_report/domain/entities/damage_report.dart';

void main() {
  final testDate = DateTime(2024, 1, 15, 10, 30);

  group('DamageReport', () {
    late DamageReport testReport;

    setUp(() {
      testReport = DamageReport(
        id: 'test-id-123',
        taskId: 'task-456',
        reporterName: 'John Doe',
        damageType: DamageType.leak,
        severity: DamageSeverity.high,
        latitude: -6.208763,
        longitude: 106.845599,
        description: 'Pipa bocor di bagian tengah',
        reportedAt: testDate,
        photoPaths: const ['/path/photo1.jpg', '/path/photo2.jpg'],
        isSynced: true,
      );
    });

    test('should create DamageReport with all properties', () {
      expect(testReport.id, 'test-id-123');
      expect(testReport.taskId, 'task-456');
      expect(testReport.reporterName, 'John Doe');
      expect(testReport.damageType, DamageType.leak);
      expect(testReport.severity, DamageSeverity.high);
      expect(testReport.latitude, -6.208763);
      expect(testReport.longitude, 106.845599);
      expect(testReport.description, 'Pipa bocor di bagian tengah');
      expect(testReport.photoPaths, ['/path/photo1.jpg', '/path/photo2.jpg']);
      expect(testReport.isSynced, true);
    });

    test('should support value equality', () {
      final sameReport = DamageReport(
        id: 'test-id-123',
        taskId: 'task-456',
        reporterName: 'John Doe',
        damageType: DamageType.leak,
        severity: DamageSeverity.high,
        latitude: -6.208763,
        longitude: 106.845599,
        description: 'Pipa bocor di bagian tengah',
        reportedAt: testDate,
        photoPaths: const ['/path/photo1.jpg', '/path/photo2.jpg'],
        isSynced: true,
      );

      expect(testReport, sameReport);
      expect(testReport.hashCode, sameReport.hashCode);
    });

    test('should not be equal when properties differ', () {
      final differentReport = DamageReport(
        id: 'different-id',
        taskId: 'task-456',
        reporterName: 'John Doe',
        damageType: DamageType.leak,
        severity: DamageSeverity.high,
        latitude: -6.208763,
        longitude: 106.845599,
        description: 'Pipa bocor di bagian tengah',
        reportedAt: testDate,
        photoPaths: const ['/path/photo1.jpg', '/path/photo2.jpg'],
        isSynced: true,
      );

      expect(testReport, isNot(differentReport));
    });

    group('copyWith', () {
      test('should return same object when no changes', () {
        final copied = testReport.copyWith();
        expect(copied, testReport);
      });

      test('should update id', () {
        final copied = testReport.copyWith(id: 'new-id');
        expect(copied.id, 'new-id');
        expect(copied.reporterName, testReport.reporterName);
      });

      test('should update reporterName', () {
        final copied = testReport.copyWith(reporterName: 'Jane Doe');
        expect(copied.reporterName, 'Jane Doe');
        expect(copied.id, testReport.id);
      });

      test('should update damageType', () {
        final copied = testReport.copyWith(damageType: DamageType.burst);
        expect(copied.damageType, DamageType.burst);
      });

      test('should update severity', () {
        final copied = testReport.copyWith(severity: DamageSeverity.critical);
        expect(copied.severity, DamageSeverity.critical);
      });

      test('should update coordinates', () {
        final copied = testReport.copyWith(
          latitude: -7.0,
          longitude: 107.0,
        );
        expect(copied.latitude, -7.0);
        expect(copied.longitude, 107.0);
      });

      test('should update description', () {
        final copied = testReport.copyWith(description: 'New description');
        expect(copied.description, 'New description');
      });

      test('should update photoPaths', () {
        final copied = testReport.copyWith(photoPaths: ['/new/photo.jpg']);
        expect(copied.photoPaths, ['/new/photo.jpg']);
      });

      test('should update isSynced', () {
        final copied = testReport.copyWith(isSynced: false);
        expect(copied.isSynced, false);
      });

      test('should update multiple fields at once', () {
        final copied = testReport.copyWith(
          id: 'new-id',
          reporterName: 'New Reporter',
          severity: DamageSeverity.critical,
        );
        expect(copied.id, 'new-id');
        expect(copied.reporterName, 'New Reporter');
        expect(copied.severity, DamageSeverity.critical);
        expect(copied.damageType, testReport.damageType);
      });
    });
  });

  group('DamageType enum', () {
    test('should have all expected values', () {
      expect(DamageType.values, [
        DamageType.leak,
        DamageType.burst,
        DamageType.corrosion,
        DamageType.blockage,
        DamageType.other,
      ]);
    });
  });

  group('DamageSeverity enum', () {
    test('should have all expected values', () {
      expect(DamageSeverity.values, [
        DamageSeverity.low,
        DamageSeverity.medium,
        DamageSeverity.high,
        DamageSeverity.critical,
      ]);
    });
  });
}
