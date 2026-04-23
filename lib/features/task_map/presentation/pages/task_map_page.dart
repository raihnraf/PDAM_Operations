import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_map_cubit.dart';
import '../bloc/task_map_state.dart';

class TaskMapPage extends StatelessWidget {
  const TaskMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskMapCubit(context.read())..loadTasks(),
      child: const _TaskMapView(),
    );
  }
}

class _TaskMapView extends StatelessWidget {
  const _TaskMapView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.taskMapTitle)),
      body: BlocBuilder<TaskMapCubit, TaskMapState>(
        builder: (context, state) {
          return switch (state) {
            TaskMapLoading() => const LoadingIndicator(),
            TaskMapLoaded() => _MapContent(tasks: state.tasks, selectedId: state.selectedTaskId),
            TaskMapError() => _ErrorView(message: state.message),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _MapContent extends StatelessWidget {
  final List<Task> tasks;
  final String? selectedId;

  const _MapContent({required this.tasks, this.selectedId});

  @override
  Widget build(BuildContext context) {
    final markers = tasks.map((task) {
      final isSelected = task.id == selectedId;
      return Marker(
        point: LatLng(task.latitude, task.longitude),
        width: isSelected ? 50 : 40,
        height: isSelected ? 65 : 55,
        child: GestureDetector(
          onTap: () {
            HapticHelper.selection();
            context.read<TaskMapCubit>().selectTask(task.id);
            _showTaskBottomSheet(context, task);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _markerColor(task.type),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                ),
                child: Text(
                  _markerIcon(task.type),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Container(
                width: 4,
                height: 8,
                decoration: BoxDecoration(
                  color: _markerColor(task.type),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(2)),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(-7.2575, 112.7521),
        initialZoom: 13,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.pdam.pdam_fields',
        ),
        MarkerLayer(markers: markers),
      ],
    );
  }

  Color _markerColor(TaskType type) {
    return switch (type) {
      TaskType.meterReading => AppColors.primary,
      TaskType.pipeInspection => AppColors.secondary,
      TaskType.repair => AppColors.accent,
    };
  }

  String _markerIcon(TaskType type) {
    return switch (type) {
      TaskType.meterReading => '📊',
      TaskType.pipeInspection => '🔍',
      TaskType.repair => '🔧',
    };
  }

  void _showTaskBottomSheet(BuildContext context, Task task) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.customerName, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(task.address, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(_typeLabel(task.type), style: Theme.of(context).textTheme.labelLarge),
            if (task.notes != null) ...[
              const SizedBox(height: 8),
              Text(task.notes!, style: Theme.of(context).textTheme.bodySmall),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      HapticHelper.confirm();
                      context.read<TaskMapCubit>().updateTaskStatus(task.id, TaskStatus.escalated);
                      Navigator.pop(context);
                    },
                    child: const Text(AppStrings.escalate),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      HapticHelper.success();
                      context.read<TaskMapCubit>().updateTaskStatus(task.id, TaskStatus.completed);
                      Navigator.pop(context);
                    },
                    child: const Text(AppStrings.complete),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _typeLabel(TaskType type) {
    return switch (type) {
      TaskType.meterReading => 'Catat Meter',
      TaskType.pipeInspection => 'Inspeksi Pipa',
      TaskType.repair => 'Perbaikan',
    };
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: AppColors.error),
          const SizedBox(height: 16),
          Text(message, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          AppButton(
            label: AppStrings.retry,
            onPressed: () => context.read<TaskMapCubit>().loadTasks(),
          ),
        ],
      ),
    );
  }
}
