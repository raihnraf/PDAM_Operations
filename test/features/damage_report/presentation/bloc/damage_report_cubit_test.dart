import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pdam_fields/core/errors/failures.dart';
import 'package:pdam_fields/core/utils/result.dart';
import 'package:pdam_fields/features/damage_report/domain/entities/damage_report.dart';
import 'package:pdam_fields/features/damage_report/domain/repositories/damage_report_repository.dart';
import 'package:pdam_fields/features/damage_report/presentation/bloc/damage_report_cubit.dart';
import 'package:pdam_fields/features/damage_report/presentation/bloc/damage_report_state.dart';

class MockDamageReportRepository extends Mock
    implements DamageReportRepository {}

void main() {
  late DamageReportCubit cubit;
  late MockDamageReportRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(DamageReport(
      id: 'fallback-id',
      taskId: 'fallback-task',
      reporterName: 'Fallback',
      damageType: DamageType.leak,
      severity: DamageSeverity.medium,
      latitude: 0,
      longitude: 0,
      description: 'Fallback description for mocktail',
      reportedAt: DateTime(2024, 1, 1),
    ));
  });

  setUp(() {
    mockRepository = MockDamageReportRepository();
    cubit = DamageReportCubit(mockRepository);
  });

  tearDown(() => cubit.close());

  group('constructor', () {
    test('should emit DamageReportInitial when created', () {
      expect(cubit.state, isA<DamageReportInitial>());
    });
  });

  group('setReporterName', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportFormUpdated with reporter name',
      build: () => cubit,
      act: (cubit) => cubit.setReporterName('John Doe'),
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.reporterName,
          'reporterName',
          'John Doe',
        ),
      ],
    );

    blocTest<DamageReportCubit, DamageReportState>(
      'emits form update with trimmed name',
      build: () => cubit,
      act: (cubit) => cubit.setReporterName('  Jane Smith  '),
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.reporterName,
          'reporterName',
          '  Jane Smith  ',
        ),
      ],
    );
  });

  group('setDamageType', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportFormUpdated with damage type burst',
      build: () => cubit,
      act: (cubit) => cubit.setDamageType(DamageType.burst),
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.damageType,
          'damageType',
          DamageType.burst,
        ),
      ],
    );

    blocTest<DamageReportCubit, DamageReportState>(
      'emits form update with all damage types',
      build: () => cubit,
      act: (cubit) {
        cubit.setDamageType(DamageType.leak);
        cubit.setDamageType(DamageType.corrosion);
        cubit.setDamageType(DamageType.blockage);
        cubit.setDamageType(DamageType.other);
      },
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.damageType,
          'damageType',
          DamageType.leak,
        ),
        isA<DamageReportFormUpdated>().having(
          (s) => s.damageType,
          'damageType',
          DamageType.corrosion,
        ),
        isA<DamageReportFormUpdated>().having(
          (s) => s.damageType,
          'damageType',
          DamageType.blockage,
        ),
        isA<DamageReportFormUpdated>().having(
          (s) => s.damageType,
          'damageType',
          DamageType.other,
        ),
      ],
    );
  });

  group('setSeverity', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportFormUpdated with all severity levels',
      build: () => cubit,
      act: (cubit) {
        cubit.setSeverity(DamageSeverity.low);
        cubit.setSeverity(DamageSeverity.high);
        cubit.setSeverity(DamageSeverity.critical);
      },
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.severity,
          'severity',
          DamageSeverity.low,
        ),
        isA<DamageReportFormUpdated>().having(
          (s) => s.severity,
          'severity',
          DamageSeverity.high,
        ),
        isA<DamageReportFormUpdated>().having(
          (s) => s.severity,
          'severity',
          DamageSeverity.critical,
        ),
      ],
    );
  });

  group('setLocation', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportFormUpdated with location coordinates',
      build: () => cubit,
      act: (cubit) => cubit.setLocation(-6.208763, 106.845599),
      expect: () => [
        isA<DamageReportFormUpdated>()
            .having((s) => s.latitude, 'latitude', -6.208763)
            .having((s) => s.longitude, 'longitude', 106.845599),
      ],
    );
  });

  group('setDescription', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportFormUpdated with description',
      build: () => cubit,
      act: (cubit) => cubit.setDescription('This is a detailed damage description'),
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.description,
          'description',
          'This is a detailed damage description',
        ),
      ],
    );
  });

  group('setTaskId', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportFormUpdated with task ID',
      build: () => cubit,
      act: (cubit) => cubit.setTaskId('task-123'),
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.taskId,
          'taskId',
          'task-123',
        ),
      ],
    );
  });

  group('addPhoto and removePhoto', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportFormUpdated when photo is added',
      build: () => cubit,
      act: (cubit) => cubit.addPhoto('/path/to/photo1.jpg'),
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.photoPaths,
          'photoPaths',
          ['/path/to/photo1.jpg'],
        ),
      ],
    );

    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportFormUpdated when photo is removed',
      build: () => cubit,
      setUp: () {
        cubit.addPhoto('/path/to/photo1.jpg');
        cubit.addPhoto('/path/to/photo2.jpg');
      },
      act: (cubit) => cubit.removePhoto('/path/to/photo1.jpg'),
      expect: () => [
        isA<DamageReportFormUpdated>().having(
          (s) => s.photoPaths,
          'photoPaths',
          ['/path/to/photo2.jpg'],
        ),
      ],
    );
  });

  group('hasLocation', () {
    test('returns false when latitude and longitude are 0', () {
      expect(cubit.hasLocation, isFalse);
    });

    test('returns true when latitude is non-zero', () {
      cubit.setLocation(-6.0, 0);
      expect(cubit.hasLocation, isTrue);
    });

    test('returns true when longitude is non-zero', () {
      cubit.setLocation(0, 106.0);
      expect(cubit.hasLocation, isTrue);
    });
  });

  group('validate', () {
    test('returns error when reporter name is empty', () {
      cubit.setReporterName('');
      cubit.setDescription('This is a valid description with more than 20 chars');
      cubit.setLocation(-6.0, 106.0);
      expect(cubit.validate(), equals('Nama petugas wajib diisi'));
    });

    test('returns error when description is empty', () {
      cubit.setReporterName('John Doe');
      cubit.setDescription('');
      cubit.setLocation(-6.0, 106.0);
      expect(cubit.validate(), equals('Deskripsi kerusakan wajib diisi'));
    });

    test('returns error when description is less than 20 characters', () {
      cubit.setReporterName('John Doe');
      cubit.setDescription('Short desc');
      cubit.setLocation(-6.0, 106.0);
      expect(cubit.validate(), equals('Deskripsi minimal 20 karakter'));
    });

    test('returns error when location is not set', () {
      cubit.setReporterName('John Doe');
      cubit.setDescription('This is a valid description with more than 20 chars');
      expect(cubit.validate(), equals('Lokasi belum ditentukan'));
    });

    test('returns null when all fields are valid', () {
      cubit.setReporterName('John Doe');
      cubit.setDescription('This is a valid description with more than 20 chars');
      cubit.setLocation(-6.0, 106.0);
      expect(cubit.validate(), isNull);
    });
  });

  group('validateStep', () {
    test('returns error for step 0 when reporter name is empty', () {
      cubit.setReporterName('');
      expect(cubit.validateStep(0), equals('Nama petugas wajib diisi'));
    });

    test('returns null for step 0 when reporter name is provided', () {
      cubit.setReporterName('John Doe');
      expect(cubit.validateStep(0), isNull);
    });

    test('returns null for step 1 (damage type)', () {
      expect(cubit.validateStep(1), isNull);
    });

    test('returns error for step 2 when description is too short', () {
      cubit.setDescription('Short');
      expect(cubit.validateStep(2), equals('Deskripsi minimal 20 karakter'));
    });

    test('returns error for step 2 when description is empty', () {
      cubit.setDescription('');
      expect(cubit.validateStep(2), equals('Deskripsi wajib diisi'));
    });

    test('returns null for step 3 (review)', () {
      expect(cubit.validateStep(3), isNull);
    });
  });

  group('submitReport', () {
    final validReport = DamageReport(
      id: 'test-id',
      taskId: 'task-123',
      reporterName: 'John Doe',
      damageType: DamageType.leak,
      severity: DamageSeverity.medium,
      latitude: -6.208763,
      longitude: 106.845599,
      description: 'This is a detailed damage description',
      reportedAt: DateTime.now(),
      photoPaths: const [],
      isSynced: false,
    );

    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportError when validation fails',
      build: () => cubit,
      act: (cubit) => cubit.submitReport(),
      expect: () => [
        isA<DamageReportError>().having(
          (s) => s.message,
          'message',
          'Nama petugas wajib diisi',
        ),
      ],
    );

    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportLoading then DamageReportSaved when submission succeeds',
      setUp: () {
        cubit.setReporterName('John Doe');
        cubit.setDamageType(DamageType.leak);
        cubit.setSeverity(DamageSeverity.medium);
        cubit.setDescription('This is a detailed damage description with sufficient length');
        cubit.setLocation(-6.208763, 106.845599);
        cubit.setTaskId('task-123');
        when(() => mockRepository.saveReport(any()))
            .thenAnswer((_) async => Success(validReport));
      },
      build: () => cubit,
      act: (cubit) => cubit.submitReport(),
      expect: () => [
        isA<DamageReportLoading>(),
        isA<DamageReportSaved>(),
      ],
      verify: (_) {
        verify(() => mockRepository.saveReport(any())).called(1);
      },
    );

    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportLoading then DamageReportError when submission fails',
      setUp: () {
        cubit.setReporterName('John Doe');
        cubit.setDamageType(DamageType.leak);
        cubit.setSeverity(DamageSeverity.medium);
        cubit.setDescription('This is a detailed damage description with sufficient length');
        cubit.setLocation(-6.208763, 106.845599);
        cubit.setTaskId('task-123');
        when(() => mockRepository.saveReport(any())).thenAnswer(
          (_) async => const FailureResult(ServerFailure('Network error')),
        );
      },
      build: () => cubit,
      act: (cubit) => cubit.submitReport(),
      expect: () => [
        isA<DamageReportLoading>(),
        isA<DamageReportError>().having(
          (s) => s.message,
          'message',
          'Network error',
        ),
      ],
    );
  });

  group('reset', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'emits DamageReportInitial and clears all fields',
      build: () => cubit,
      seed: () => DamageReportFormUpdated(
        damageType: DamageType.burst,
        severity: DamageSeverity.high,
        description: 'Test description',
        latitude: -6.0,
        longitude: 106.0,
        reporterName: 'Test User',
        taskId: 'task-456',
        photoPaths: const ['/path/to/photo.jpg'],
      ),
      act: (cubit) => cubit.reset(),
      expect: () => [isA<DamageReportInitial>()],
      verify: (cubit) {
        expect(cubit.damageType, DamageType.leak);
        expect(cubit.severity, DamageSeverity.medium);
        expect(cubit.description, isEmpty);
        expect(cubit.latitude, 0);
        expect(cubit.longitude, 0);
        expect(cubit.reporterName, isEmpty);
        expect(cubit.taskId, isEmpty);
        expect(cubit.photoPaths, isEmpty);
      },
    );
  });

  group('does not emit during loading or saved states', () {
    blocTest<DamageReportCubit, DamageReportState>(
      'does not emit form updates when state is DamageReportLoading',
      build: () => cubit,
      seed: () => DamageReportLoading(),
      act: (cubit) => cubit.setReporterName('Test Name'),
      expect: () => [],
    );

    blocTest<DamageReportCubit, DamageReportState>(
      'does not emit form updates when state is DamageReportSaved',
      build: () => cubit,
      seed: () => DamageReportSaved(DamageReport(
        id: 'test-id',
        taskId: 'task-1',
        reporterName: 'Test',
        damageType: DamageType.leak,
        severity: DamageSeverity.medium,
        latitude: 0,
        longitude: 0,
        description: 'Test',
        reportedAt: DateTime.now(),
      )),
      act: (cubit) => cubit.setReporterName('Test Name'),
      expect: () => [],
    );
  });
}
