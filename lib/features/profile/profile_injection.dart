import '../../injection_container.dart';
import 'presentation/bloc/profile_cubit.dart';

void initProfile() {
  sl.registerFactory<ProfileCubit>(() => ProfileCubit());
}
