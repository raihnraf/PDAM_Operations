import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/entities/task.dart';
import 'task_map_state.dart';

class TaskMapCubit extends Cubit<TaskMapState> {
  final TaskRepository repository;

  TaskMapCubit(this.repository) : super(TaskMapInitial());

  Future<void> loadTasks() async {
    emit(TaskMapLoading());
    final result = await repository.getTasks();
    result.fold(
      (failure) => emit(TaskMapError(failure.message)),
      (tasks) => emit(TaskMapLoaded(tasks: tasks)),
    );
  }

  Future<void> selectTask(String id) async {
    final state = this.state;
    if (state is TaskMapLoaded) {
      emit(TaskMapLoaded(tasks: state.tasks, selectedTaskId: id));
    }
  }

  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    final result = await repository.updateTaskStatus(id, status);
    result.fold(
      (failure) => emit(TaskMapError(failure.message)),
      (_) => loadTasks(),
    );
  }

  void clearError() {
    if (state is TaskMapError) {
      emit(TaskMapInitial());
    }
  }
}
