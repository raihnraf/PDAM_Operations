import '../../injection_container.dart';
import 'data/repositories/mock_profile_repository.dart';
import 'domain/repositories/profile_repository.dart';
import 'presentation/bloc/profile_cubit.dart';

void initProfileRepository() {
  sl.registerLazySingleton<ProfileRepository>(() => MockProfileRepository());
}

void initProfile() {
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));
}
