import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pdam_fields/core/errors/failures.dart';
import 'package:pdam_fields/core/utils/result.dart';
import 'package:pdam_fields/features/damage_report/domain/entities/damage_report.dart';
import 'package:pdam_fields/features/sync/domain/entities/pending_report.dart';
import 'package:pdam_fields/features/sync/domain/repositories/sync_repository.dart';
import 'package:pdam_fields/features/sync/presentation/bloc/sync_cubit.dart';
import 'package:pdam_fields/features/sync/presentation/bloc/sync_state.dart';

class MockSyncRepository extends Mock implements SyncRepository {}

void main() {
  late SyncCubit cubit;
  late MockSyncRepository mockRepository;

  final testReports = <PendingReport>[
    PendingReport(
      id: 'report-1',
      type: DamageType.leak,
      title: 'Kebocoran di Jl. Sudirman',
      savedAt: DateTime(2026, 4, 25, 10, 0),
    ),
    PendingReport(
      id: 'report-2',
      type: DamageType.burst,
      title: 'Pipa pecah di Jl. Thamrin',
      savedAt: DateTime(2026, 4, 25, 11, 0),
    ),
  ];

  setUp(() {
    mockRepository = MockSyncRepository();
    cubit = SyncCubit(mockRepository);
  });

  tearDown(() => cubit.close());

  group('constructor', () {
    test('should emit SyncInitial when created', () {
      expect(cubit.state, isA<SyncInitial>());
    });
  });

  group('loadData', () {
    blocTest<SyncCubit, SyncState>(
      'emits SyncLoading then SyncLoaded when successful',
      setUp: () {
        when(() => mockRepository.getPendingReports())
            .thenAnswer((_) async => Success(testReports));
        when(() => mockRepository.getStorageUsageBytes())
            .thenAnswer((_) async => const Success(1024));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<SyncLoading>(),
        isA<SyncLoaded>()
            .having((s) => s.pendingReports, 'pendingReports', testReports)
            .having((s) => s.storageBytes, 'storageBytes', 1024)
            .having((s) => s.isSyncing, 'isSyncing', false),
      ],
      verify: (_) {
        verify(() => mockRepository.getPendingReports()).called(1);
        verify(() => mockRepository.getStorageUsageBytes()).called(1);
      },
    );

    blocTest<SyncCubit, SyncState>(
      'emits SyncLoading then empty SyncLoaded when getPendingReports fails',
      setUp: () {
        when(() => mockRepository.getPendingReports()).thenAnswer(
            (_) async => const FailureResult(ServerFailure('Cache error')));
        when(() => mockRepository.getStorageUsageBytes())
            .thenAnswer((_) async => const Success(512));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<SyncLoading>(),
        isA<SyncLoaded>()
            .having((s) => s.pendingReports, 'pendingReports', isEmpty)
            .having((s) => s.storageBytes, 'storageBytes', 512),
      ],
    );

    blocTest<SyncCubit, SyncState>(
      'emits SyncLoading then empty SyncLoaded when getStorageUsageBytes fails',
      setUp: () {
        when(() => mockRepository.getPendingReports())
            .thenAnswer((_) async => Success(testReports));
        when(() => mockRepository.getStorageUsageBytes()).thenAnswer(
            (_) async => const FailureResult(ServerFailure('Cache error')));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<SyncLoading>(),
        isA<SyncLoaded>()
            .having((s) => s.pendingReports, 'pendingReports', testReports)
            .having((s) => s.storageBytes, 'storageBytes', 0),
      ],
    );

    blocTest<SyncCubit, SyncState>(
      'emits SyncError when an exception is thrown',
      setUp: () {
        when(() => mockRepository.getPendingReports())
            .thenThrow(Exception('Unexpected error'));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<SyncLoading>(),
        isA<SyncError>().having(
          (s) => s.message,
          'message',
          'Failed to load sync data',
        ),
      ],
    );
  });

  group('syncAll', () {
    blocTest<SyncCubit, SyncState>(
      'syncs successfully and clears pending reports',
      setUp: () {
        when(() => mockRepository.syncAll())
            .thenAnswer((_) async => const Success(null));
      },
      build: () => cubit,
      seed: () => SyncState.loaded(
        pendingReports: testReports,
        storageBytes: 2048,
      ),
      act: (cubit) => cubit.syncAll(),
      expect: () => [
        isA<SyncLoaded>()
            .having((s) => s.isSyncing, 'isSyncing', true)
            .having((s) => s.syncError, 'syncError', isNull),
        isA<SyncLoaded>()
            .having((s) => s.pendingReports, 'pendingReports', isEmpty)
            .having((s) => s.storageBytes, 'storageBytes', 0)
            .having((s) => s.isSyncing, 'isSyncing', false)
            .having((s) => s.syncError, 'syncError', isNull)
            .having((s) => s.lastSyncTime, 'lastSyncTime', isNotNull),
      ],
      verify: (_) {
        verify(() => mockRepository.syncAll()).called(1);
      },
    );

    blocTest<SyncCubit, SyncState>(
      'emits error when sync fails',
      setUp: () {
        when(() => mockRepository.syncAll()).thenAnswer(
            (_) async => const FailureResult(ServerFailure('Network error')));
      },
      build: () => cubit,
      seed: () => SyncState.loaded(
        pendingReports: testReports,
        storageBytes: 2048,
      ),
      act: (cubit) => cubit.syncAll(),
      expect: () => [
        isA<SyncLoaded>()
            .having((s) => s.isSyncing, 'isSyncing', true)
            .having((s) => s.syncError, 'syncError', isNull),
        isA<SyncLoaded>()
            .having((s) => s.pendingReports, 'pendingReports', testReports)
            .having((s) => s.storageBytes, 'storageBytes', 2048)
            .having((s) => s.isSyncing, 'isSyncing', false)
            .having((s) => s.syncError, 'syncError', 'Network error'),
      ],
    );

    blocTest<SyncCubit, SyncState>(
      'does nothing when already syncing',
      setUp: () {
        when(() => mockRepository.syncAll())
            .thenAnswer((_) async => const Success(null));
      },
      build: () => cubit,
      seed: () => SyncState.loaded(
        pendingReports: testReports,
        isSyncing: true,
      ),
      act: (cubit) => cubit.syncAll(),
      expect: () => [],
      verify: (_) {
        verifyNever(() => mockRepository.syncAll());
      },
    );

    blocTest<SyncCubit, SyncState>(
      'does nothing when state is not SyncLoaded',
      setUp: () {
        when(() => mockRepository.syncAll())
            .thenAnswer((_) async => const Success(null));
      },
      build: () => cubit,
      act: (cubit) => cubit.syncAll(),
      expect: () => [],
      verify: (_) {
        verifyNever(() => mockRepository.syncAll());
      },
    );
  });

  group('clearSyncError', () {
    blocTest<SyncCubit, SyncState>(
      'clears sync error when present',
      build: () => cubit,
      seed: () => SyncState.loaded(
        pendingReports: testReports,
        syncError: 'Previous error',
      ),
      act: (cubit) => cubit.clearSyncError(),
      expect: () => [
        isA<SyncLoaded>()
            .having((s) => s.syncError, 'syncError', isNull)
            .having((s) => s.pendingReports, 'pendingReports', testReports),
      ],
    );

    test('does nothing when there is no sync error', () {
      cubit.emit(SyncState.loaded(
        pendingReports: testReports,
      ));
      cubit.clearSyncError();
      expect(cubit.state, isA<SyncLoaded>());
      expect((cubit.state as SyncLoaded).syncError, isNull);
    });

    test('does nothing when state is not SyncLoaded', () {
      cubit.clearSyncError();
      expect(cubit.state, isA<SyncInitial>());
    });
  });
}
