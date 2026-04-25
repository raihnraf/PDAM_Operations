import '../../injection_container.dart';
import 'data/repositories/mock_sync_repository.dart';
import 'domain/repositories/sync_repository.dart';
import 'presentation/bloc/sync_cubit.dart';

void initSync() {
  sl.registerLazySingleton<SyncRepository>(
    () => MockSyncRepository(secureStorage: sl()),
  );
  sl.registerFactory<SyncCubit>(() => SyncCubit(sl()));
}
