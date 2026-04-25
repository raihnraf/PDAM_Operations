import 'package:freezed_annotation/freezed_annotation.dart';

part 'officer_profile.freezed.dart';

@freezed
class OfficerProfile with _$OfficerProfile {
  const factory OfficerProfile({
    required String id,
    required String name,
    required String role,
    required String unit,
    @Default(0) int tasksCompleted,
    @Default(0) int tasksThisWeek,
    @Default(0) int hoursInField,
    @Default(0) int efficiencyScore,
    @Default(false) bool isOnDuty,
  }) = _OfficerProfile;
}
