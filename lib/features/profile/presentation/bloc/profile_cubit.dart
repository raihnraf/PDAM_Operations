import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/profile_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(const ProfileState.initial());

  Future<void> loadProfile() async {
    emit(const ProfileState.loading());
    final result = await repository.getProfile();
    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> toggleDutyStatus(bool isOnDuty) async {
    final result = await repository.updateDutyStatus(isOnDuty);
    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }
}
