import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

enum TaskType { meterReading, pipeInspection, repair }

enum TaskStatus { pending, inProgress, completed, escalated }

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String customerId,
    required String customerName,
    required String address,
    required double latitude,
    required double longitude,
    required TaskType type,
    @Default(TaskStatus.pending) TaskStatus status,
    required DateTime scheduledDate,
    String? notes,
  }) = _Task;
}
