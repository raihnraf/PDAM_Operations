import '../../../../core/utils/result.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<Result<List<Task>>> getTasks();
  Future<Result<Task>> getTaskById(String id);
  Future<Result<Task>> updateTaskStatus(String id, TaskStatus status);
  Future<Result<List<Task>>> getTasksByLocation(double lat, double lng, double radiusKm);
}
