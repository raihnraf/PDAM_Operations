import '../../injection_container.dart';
import 'presentation/bloc/task_list_cubit.dart';

void initTaskList() {
  sl.registerFactory<TaskListCubit>(() => TaskListCubit(sl()));
}
