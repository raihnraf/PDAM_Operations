import 'package:equatable/equatable.dart';
import '../../../task_map/domain/entities/task.dart';

enum TaskFilter { pending, completed }

sealed class TaskListState extends Equatable {
  const TaskListState();

  @override
  List<Object?> get props => [];
}

class TaskListInitial extends TaskListState {}

class TaskListLoading extends TaskListState {}

class TaskListLoaded extends TaskListState {
  final List<Task> tasks;
  final TaskFilter activeFilter;
  final String? actingTaskId;

  const TaskListLoaded({
    required this.tasks,
    this.activeFilter = TaskFilter.pending,
    this.actingTaskId,
  });

  TaskListLoaded copyWith({
    List<Task>? tasks,
    TaskFilter? activeFilter,
    String? actingTaskId,
  }) {
    return TaskListLoaded(
      tasks: tasks ?? this.tasks,
      activeFilter: activeFilter ?? this.activeFilter,
      actingTaskId: actingTaskId ?? this.actingTaskId,
    );
  }

  @override
  List<Object?> get props => [tasks, activeFilter, actingTaskId];
}

class TaskListError extends TaskListState {
  final String message;

  const TaskListError(this.message);

  @override
  List<Object?> get props => [message];
}
