import '../../../../core/constants/constants.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/officer_profile.dart';
import '../../domain/repositories/profile_repository.dart';

class MockProfileRepository implements ProfileRepository {
  OfficerProfile _profile = const OfficerProfile(
    id: 'TKR-4029',
    name: 'Petugas Pratama',
    role: 'Teknisi Lapangan Senior',
    unit: 'Wilayah Barat',
    tasksCompleted: 1204,
    tasksThisWeek: 12,
    hoursInField: 840,
    efficiencyScore: 94,
    isOnDuty: true,
  );

  @override
  Future<Result<OfficerProfile>> getProfile() async {
    await Future.delayed(AppDuration.mockNormal);
    return Success(_profile);
  }

  @override
  Future<Result<OfficerProfile>> updateDutyStatus(bool isOnDuty) async {
    await Future.delayed(AppDuration.mockNormal);
    _profile = _profile.copyWith(isOnDuty: isOnDuty);
    return Success(_profile);
  }
}
