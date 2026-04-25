import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pdam_fields/core/errors/failures.dart';
import 'package:pdam_fields/core/utils/result.dart';
import 'package:pdam_fields/features/profile/domain/entities/officer_profile.dart';
import 'package:pdam_fields/features/profile/domain/repositories/profile_repository.dart';
import 'package:pdam_fields/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:pdam_fields/features/profile/presentation/bloc/profile_state.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late ProfileCubit cubit;
  late MockProfileRepository mockRepository;

  final testProfile = OfficerProfile(
    id: 'officer-1',
    name: 'Agus Setiawan',
    role: 'Petugas Lapangan',
    unit: 'Unit Surabaya Pusat',
    tasksCompleted: 142,
    tasksThisWeek: 12,
    hoursInField: 87,
    efficiencyScore: 94,
    isOnDuty: true,
  );

  setUp(() {
    mockRepository = MockProfileRepository();
    cubit = ProfileCubit(mockRepository);
  });

  tearDown(() => cubit.close());

  group('constructor', () {
    test('should emit ProfileInitial when created', () {
      expect(cubit.state, isA<ProfileInitial>());
    });
  });

  group('loadProfile', () {
    blocTest<ProfileCubit, ProfileState>(
      'emits ProfileLoading then ProfileLoaded when successful',
      setUp: () {
        when(() => mockRepository.getProfile())
            .thenAnswer((_) async => Success(testProfile));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadProfile(),
      expect: () => [
        isA<ProfileLoading>(),
        isA<ProfileLoaded>()
            .having((s) => s.profile, 'profile', testProfile),
      ],
      verify: (_) {
        verify(() => mockRepository.getProfile()).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits ProfileLoading then ProfileError when failed',
      setUp: () {
        when(() => mockRepository.getProfile()).thenAnswer(
            (_) async => const FailureResult(ServerFailure('Cache error')));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadProfile(),
      expect: () => [
        isA<ProfileLoading>(),
        isA<ProfileError>().having(
          (s) => s.message,
          'message',
          'Cache error',
        ),
      ],
    );
  });

  group('toggleDutyStatus', () {
    final updatedProfile = testProfile.copyWith(isOnDuty: false);

    blocTest<ProfileCubit, ProfileState>(
      'emits ProfileLoaded with updated status when successful',
      setUp: () {
        when(() => mockRepository.updateDutyStatus(false))
            .thenAnswer((_) async => Success(updatedProfile));
      },
      build: () => cubit,
      act: (cubit) => cubit.toggleDutyStatus(false),
      expect: () => [
        isA<ProfileLoaded>()
            .having((s) => s.profile, 'profile', updatedProfile),
      ],
      verify: (_) {
        verify(() => mockRepository.updateDutyStatus(false)).called(1);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'emits ProfileError when status update fails',
      setUp: () {
        when(() => mockRepository.updateDutyStatus(true)).thenAnswer(
            (_) async => const FailureResult(ServerFailure('Update failed')));
      },
      build: () => cubit,
      act: (cubit) => cubit.toggleDutyStatus(true),
      expect: () => [
        isA<ProfileError>().having(
          (s) => s.message,
          'message',
          'Update failed',
        ),
      ],
    );
  });
}
