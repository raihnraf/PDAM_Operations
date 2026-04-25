import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_map_cubit.dart';
import '../bloc/task_map_state.dart';
import '../widgets/navigate_to_site_card.dart';

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
      body: BlocBuilder<TaskMapCubit, TaskMapState>(
        builder: (context, state) {
          return switch (state) {
            TaskMapLoading() => const Center(child: CircularProgressIndicator()),
            TaskMapLoaded() => _MapContent(
                tasks: state.tasks,
                selectedId: state.selectedTaskId,
              ),
            TaskMapError() => ErrorStateView(
              message: state.message,
              onRetry: () => context.read<TaskMapCubit>().loadTasks(),
            ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _MapContent extends StatefulWidget {
  final List<Task> tasks;
  final String? selectedId;

  const _MapContent({required this.tasks, this.selectedId});

  @override
  State<_MapContent> createState() => _MapContentState();
}

class _MapContentState extends State<_MapContent> {
  final MapController _mapController = MapController();
  bool _showSiteCard = true;

  Task? get _selectedTask {
    if (widget.selectedId == null) return null;
    return widget.tasks.firstWhere(
      (t) => t.id == widget.selectedId,
      orElse: () => widget.tasks.first,
    );
  }

  Task? get _nextPendingTask {
    if (!_showSiteCard) return null;
    return widget.tasks
        .where((t) =>
            t.status == TaskStatus.pending ||
            t.status == TaskStatus.inProgress)
        .firstOrNull;
  }

  void _onMarkerTap(Task task) {
    HapticHelper.selection();
    context.read<TaskMapCubit>().selectTask(task.id);
    _mapController.move(
      LatLng(task.latitude, task.longitude),
      _mapController.camera.zoom,
    );
  }

  @override
  Widget build(BuildContext context) {
    final markers = widget.tasks.map((task) {
      final isSelected = task.id == widget.selectedId;
      return Marker(
        point: LatLng(task.latitude, task.longitude),
        width: isSelected ? 60 : 48,
        height: isSelected ? 80 : 64,
        child: GestureDetector(
          onTap: () => _onMarkerTap(task),
          child: _TaskMarker(
            task: task,
            isSelected: isSelected,
          ),
        ),
      );
    }).toList();

    final pendingTask = _nextPendingTask;
    final fabBottom = pendingTask != null ? 280.0 : 16.0;

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: const LatLng(-7.2575, 112.7521),
            initialZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.pdam.pdam_fields',
            ),
            MarkerLayer(markers: markers),
          ],
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.3, 1.0],
                  colors: [
                    Theme.of(context).colorScheme.surface.withAlpha(217),
                    Theme.of(context).colorScheme.surface.withAlpha(26),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
        if (pendingTask != null)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: NavigateToSiteCard(
              task: pendingTask,
              onTap: () {
                HapticHelper.selection();
                _mapController.move(
                  LatLng(pendingTask.latitude, pendingTask.longitude),
                  15,
                );
                context.read<TaskMapCubit>().selectTask(pendingTask.id);
              },
            ),
          ),
        Positioned(
          bottom: fabBottom,
          right: 16,
          child: _LocateMeFAB(mapController: _mapController),
        ),
      ],
    );
  }
}

class _TaskMarker extends StatelessWidget {
  final Task task;
  final bool isSelected;

  const _TaskMarker({required this.task, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: AppDuration.animationNormal,
          padding: AppSpacing.allSm,
          decoration: BoxDecoration(
            color: _markerBgColor(task),
            border: Border.all(
              color: _markerBorderColor(task),
              width: 2,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.blackOverlay15,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            _markerIcon(task.type),
            color: _markerIconColor(task),
            size: 20,
          ),
        ),
        Container(
          width: 3,
          height: 10,
          color: _markerBgColor(task),
        ),
        if (isSelected)
          Container(
            width: 8,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.blackOverlay30,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
      ],
    );
  }

  Color _markerBgColor(Task task) {
    if (task.status == TaskStatus.escalated) return AppColors.error;
    return switch (task.type) {
      TaskType.meterReading => AppColors.primaryContainer,
      TaskType.pipeInspection => AppColors.secondary,
      TaskType.repair => AppColors.accent,
    };
  }

  Color _markerBorderColor(Task task) {
    if (task.status == TaskStatus.escalated) return AppColors.errorContainer;
    return switch (task.type) {
      TaskType.meterReading => AppColors.primaryFixedDim,
      TaskType.pipeInspection => AppColors.secondaryOverlay60,
      TaskType.repair => AppColors.accentLight,
    };
  }

  Color _markerIconColor(Task task) {
    if (task.status == TaskStatus.escalated) return Colors.white;
    return switch (task.type) {
      TaskType.meterReading => AppColors.onPrimaryContainer,
      TaskType.pipeInspection => Colors.white,
      TaskType.repair => Colors.white,
    };
  }

  IconData _markerIcon(TaskType type) {
    return switch (type) {
      TaskType.meterReading => Icons.water_drop_outlined,
      TaskType.pipeInspection => Icons.search_outlined,
      TaskType.repair => Icons.build_outlined,
    };
  }
}

class _LocateMeFAB extends StatelessWidget {
  final MapController mapController;

  const _LocateMeFAB({required this.mapController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackOverlay20,
            blurRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticHelper.selection();
          },
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              Icons.my_location_outlined,
              color: AppColors.primary,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
