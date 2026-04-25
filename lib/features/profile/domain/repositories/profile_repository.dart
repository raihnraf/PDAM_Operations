import '../../../../core/utils/result.dart';
import '../entities/officer_profile.dart';

abstract class ProfileRepository {
  Future<Result<OfficerProfile>> getProfile();
  Future<Result<OfficerProfile>> updateDutyStatus(bool isOnDuty);
}
