import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/officer_profile.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile() {
    emit(ProfileLoading());
    emit(const ProfileLoaded(OfficerProfile(
      id: 'TKR-4029',
      name: 'Petugas Pratama',
      role: 'Teknisi Lapangan Senior',
      unit: 'Wilayah Barat',
      tasksCompleted: 1204,
      tasksThisWeek: 12,
      hoursInField: 840,
      efficiencyScore: 94,
      isOnDuty: true,
    )));
  }

  void toggleDutyStatus(bool isOnDuty) {
    final state = this.state;
    if (state is ProfileLoaded) {
      emit(ProfileLoaded(state.profile.copyWith(isOnDuty: isOnDuty)));
    }
  }
}

extension on OfficerProfile {
  OfficerProfile copyWith({
    String? id,
    String? name,
    String? role,
    String? unit,
    int? tasksCompleted,
    int? tasksThisWeek,
    int? hoursInField,
    int? efficiencyScore,
    bool? isOnDuty,
  }) {
    return OfficerProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      unit: unit ?? this.unit,
      tasksCompleted: tasksCompleted ?? this.tasksCompleted,
      tasksThisWeek: tasksThisWeek ?? this.tasksThisWeek,
      hoursInField: hoursInField ?? this.hoursInField,
      efficiencyScore: efficiencyScore ?? this.efficiencyScore,
      isOnDuty: isOnDuty ?? this.isOnDuty,
    );
  }
}
