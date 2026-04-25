import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../task_map/domain/entities/task.dart';

part 'task_list_state.freezed.dart';

enum TaskFilter { pending, completed }

@freezed
class TaskListState with _$TaskListState {
  const factory TaskListState.initial() = TaskListInitial;
  const factory TaskListState.loading() = TaskListLoading;
  const factory TaskListState.loaded({
    required List<Task> tasks,
    @Default(TaskFilter.pending) TaskFilter activeFilter,
    String? actingTaskId,
  }) = TaskListLoaded;
  const factory TaskListState.error(String message) = TaskListError;
}
