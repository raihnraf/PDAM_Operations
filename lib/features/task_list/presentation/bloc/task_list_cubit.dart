import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../task_map/domain/entities/task.dart';
import '../../../task_map/domain/repositories/task_repository.dart';
import 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskRepository repository;

  TaskListCubit(this.repository) : super(TaskListInitial());

  Future<void> loadTasks() async {
    emit(TaskListLoading());
    final result = await repository.getTasks();
    result.fold(
      (failure) => emit(const TaskListError('Gagal memuat tugas')),
      (tasks) {
        final currentFilter = state is TaskListLoaded
            ? (state as TaskListLoaded).activeFilter
            : TaskFilter.pending;
        emit(TaskListLoaded(tasks: tasks, activeFilter: currentFilter));
      },
    );
  }

  void setFilter(TaskFilter filter) {
    if (state is! TaskListLoaded) return;
    final current = state as TaskListLoaded;
    emit(current.copyWith(activeFilter: filter, actingTaskId: null));
  }

  List<Task> getFilteredTasks() {
    if (state is! TaskListLoaded) return [];
    final current = state as TaskListLoaded;
    return switch (current.activeFilter) {
      TaskFilter.pending => current.tasks
          .where((t) =>
              t.status == TaskStatus.pending ||
              t.status == TaskStatus.inProgress ||
              t.status == TaskStatus.escalated)
          .toList(),
      TaskFilter.completed =>
        current.tasks.where((t) => t.status == TaskStatus.completed).toList(),
    };
  }

  Future<void> completeTask(String id) async {
    if (state is! TaskListLoaded) return;
    final current = state as TaskListLoaded;

    emit(current.copyWith(actingTaskId: id));

    final result = await repository.updateTaskStatus(id, TaskStatus.completed);
    result.fold(
      (failure) {
        emit(current.copyWith(actingTaskId: null));
        emit(TaskListError('Gagal menyelesaikan tugas'));
      },
      (_) => loadTasks(),
    );
  }

  Future<void> escalateTask(String id) async {
    if (state is! TaskListLoaded) return;
    final current = state as TaskListLoaded;

    emit(current.copyWith(actingTaskId: id));

    final result = await repository.updateTaskStatus(id, TaskStatus.escalated);
    result.fold(
      (failure) {
        emit(current.copyWith(actingTaskId: null));
        emit(TaskListError('Gagal melakukan eskalasi'));
      },
      (_) => loadTasks(),
    );
  }

  void clearError() {
    if (state is TaskListError) {
      emit(TaskListInitial());
    }
  }
}
