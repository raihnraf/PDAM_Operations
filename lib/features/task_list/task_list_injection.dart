import '../../injection_container.dart';
import '../task_map/data/repositories/mock_task_repository.dart';
import '../task_map/domain/repositories/task_repository.dart';
import 'presentation/bloc/task_list_cubit.dart';

void initTaskList() {
  sl.registerLazySingleton<TaskRepository>(() => MockTaskRepository());
  sl.registerFactory<TaskListCubit>(() => TaskListCubit(sl()));
}
