import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../task_map/domain/repositories/task_repository.dart';
import '../../../task_map/domain/entities/task.dart';
import 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskRepository repository;

  TaskListCubit(this.repository) : super(TaskListInitial());

  Future<void> loadTasks() async {
    emit(TaskListLoading());
    final result = await repository.getTasks();
    result.fold(
      (failure) => emit(const TaskListError('Gagal memuat tugas')),
      (tasks) => emit(TaskListLoaded(tasks)),
    );
  }

  Future<void> completeTask(String id) async {
    final result = await repository.updateTaskStatus(id, TaskStatus.completed);
    result.fold(
      (_) => emit(const TaskListError('Gagal menyelesaikan tugas')),
      (_) => loadTasks(),
    );
  }

  Future<void> escalateTask(String id) async {
    final result = await repository.updateTaskStatus(id, TaskStatus.escalated);
    result.fold(
      (_) => emit(const TaskListError('Gagal melakukan eskalasi')),
      (_) => loadTasks(),
    );
  }
}
