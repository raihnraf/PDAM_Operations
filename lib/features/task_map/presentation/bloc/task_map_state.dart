import 'package:equatable/equatable.dart';
import '../../domain/entities/task.dart';

sealed class TaskMapState extends Equatable {
  const TaskMapState();

  @override
  List<Object?> get props => [];
}

class TaskMapInitial extends TaskMapState {}

class TaskMapLoading extends TaskMapState {}

class TaskMapLoaded extends TaskMapState {
  final List<Task> tasks;
  final String? selectedTaskId;

  const TaskMapLoaded({this.tasks = const [], this.selectedTaskId});

  @override
  List<Object?> get props => [tasks, selectedTaskId];
}

class TaskMapError extends TaskMapState {
  final String message;

  const TaskMapError(this.message);

  @override
  List<Object?> get props => [message];
}
