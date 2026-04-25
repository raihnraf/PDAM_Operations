import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/entities/task.dart';
import 'task_map_state.dart';

class TaskMapCubit extends Cubit<TaskMapState> {
  final TaskRepository repository;

  TaskMapCubit(this.repository) : super(const TaskMapState.initial());

  Future<void> loadTasks() async {
    emit(const TaskMapState.loading());
    final result = await repository.getTasks();
    result.fold(
      (failure) => emit(TaskMapState.error(failure.message)),
      (tasks) => emit(TaskMapState.loaded(tasks: tasks)),
    );
  }

  Future<void> selectTask(String id) async {
    final state = this.state;
    if (state is TaskMapLoaded) {
      emit(TaskMapState.loaded(tasks: state.tasks, selectedTaskId: id));
    }
  }

  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    final result = await repository.updateTaskStatus(id, status);
    result.fold(
      (failure) => emit(TaskMapState.error(failure.message)),
      (_) => loadTasks(),
    );
  }

  void clearError() {
    if (state is TaskMapError) {
      emit(const TaskMapState.initial());
    }
  }
}
