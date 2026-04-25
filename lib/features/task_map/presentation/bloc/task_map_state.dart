import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task.dart';

part 'task_map_state.freezed.dart';

@freezed
class TaskMapState with _$TaskMapState {
  const factory TaskMapState.initial() = TaskMapInitial;
  const factory TaskMapState.loading() = TaskMapLoading;
  const factory TaskMapState.loaded({
    @Default([]) List<Task> tasks,
    String? selectedTaskId,
  }) = TaskMapLoaded;
  const factory TaskMapState.error(String message) = TaskMapError;
}
