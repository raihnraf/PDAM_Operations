import 'dart:math';
import '../../../../core/utils/result.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../models/mock_tasks.dart';

class MockTaskRepository implements TaskRepository {
  final List<Task> _tasks = List.from(MockTasks.all);

  @override
  Future<Result<List<Task>>> getTasks() async {
    await Future.delayed(AppDuration.mockSlow);
    return Success(_tasks);
  }

  @override
  Future<Result<Task>> getTaskById(String id) async {
    await Future.delayed(AppDuration.mockNormal);
    final task = _tasks.where((t) => t.id == id).firstOrNull;
    if (task == null) {
      return const FailureResult(Failure('Task tidak ditemukan'));
    }
    return Success(task);
  }

  @override
  Future<Result<Task>> updateTaskStatus(String id, TaskStatus status) async {
    await Future.delayed(AppDuration.mockNormal);
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index == -1) {
      return const FailureResult(Failure('Task tidak ditemukan'));
    }
    _tasks[index] = _tasks[index].copyWith(status: status);
    return Success(_tasks[index]);
  }

  @override
  Future<Result<List<Task>>> getTasksByLocation(double lat, double lng, double radiusKm) async {
    await Future.delayed(AppDuration.mockSlow);
    final nearby = _tasks.where((task) {
      final distance = _haversine(lat, lng, task.latitude, task.longitude);
      return distance <= radiusKm;
    }).toList();
    return Success(nearby);
  }

  double _haversine(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371;
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * pi / 180;
}
