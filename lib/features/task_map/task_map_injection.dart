import '../../injection_container.dart';
import 'data/repositories/mock_task_repository.dart';
import 'domain/repositories/task_repository.dart';
import 'presentation/bloc/task_map_cubit.dart';

void initTaskMap() {
  sl.registerLazySingleton<TaskRepository>(() => MockTaskRepository());
  sl.registerFactory<TaskMapCubit>(() => TaskMapCubit(sl()));
}
