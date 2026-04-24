import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../routing/app_routes.dart';
import '../../../task_map/domain/entities/task.dart';
import '../bloc/task_list_cubit.dart';
import '../bloc/task_list_state.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isActing = _isActing(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Dismissible(
          key: Key(task.id),
          direction: DismissDirection.horizontal,
          background: _swipeBackground(context, DismissDirection.startToEnd),
          secondaryBackground: _swipeBackground(context, DismissDirection.endToStart),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              HapticHelper.success();
              context.read<TaskListCubit>().completeTask(task.id);
            } else {
              HapticHelper.error();
              context.read<TaskListCubit>().escalateTask(task.id);
            }
            return false;
          },
          child: Material(
            color: theme.colorScheme.surfaceContainerLowest,
            child: InkWell(
              onTap: () {
                HapticHelper.selection();
                context.push('${AppRoutes.damageReport}?taskId=${task.id}');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _taskTitle(task),
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _InfoChip(
                          icon: Icons.location_on_outlined,
                          label: task.address,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: _InfoChip(
                                icon: Icons.calendar_today_outlined,
                                label: _formatDate(task.scheduledDate),
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 8),
                            _TypeChip(type: task.type),
                          ],
                        ),
                        if (task.notes != null && task.notes!.isNotEmpty) ...[
                          const SizedBox(height: 10),
                          _NotesCard(notes: task.notes!),
                        ],
                        if (isActing) ...[
                          const SizedBox(height: 12),
                          const LinearProgressIndicator(),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final statusConfig = _statusConfig(task.status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: statusConfig.bgColor,
        border: Border(
          bottom: BorderSide(
            color: statusConfig.bgColor.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          _StatusDot(status: task.status),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'ID: ${task.id.toUpperCase()}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: statusConfig.textColor,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _StatusBadge(status: task.status),
        ],
      ),
    );
  }

  Widget _swipeBackground(BuildContext context, DismissDirection direction) {
    final theme = Theme.of(context);
    final isComplete = direction == DismissDirection.startToEnd;

    return Container(
      color: isComplete ? AppColors.success : theme.colorScheme.secondaryContainer,
      alignment: isComplete ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Icon(
        isComplete ? Icons.check : Icons.warning,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  String _taskTitle(Task task) {
    return switch (task.type) {
      TaskType.meterReading => '${task.customerName} — Catat Meter',
      TaskType.pipeInspection => '${task.customerName} — Inspeksi Pipa',
      TaskType.repair => '${task.customerName} — Perbaikan',
    };
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }

  bool _isActing(BuildContext context) {
    final state = context.read<TaskListCubit>().state;
    if (state is! TaskListLoaded) return false;
    return state.actingTaskId == task.id;
  }

  ({Color bgColor, Color textColor}) _statusConfig(TaskStatus status) {
    return switch (status) {
      TaskStatus.pending => (
          bgColor: const Color(0xFFFFF8E1),
          textColor: const Color(0xFF7A6500),
        ),
      TaskStatus.inProgress => (
          bgColor: const Color(0xFFE3F2FD),
          textColor: const Color(0xFF1565C0),
        ),
      TaskStatus.escalated => (
          bgColor: const Color(0xFFFFF3E0),
          textColor: const Color(0xFFE65100),
        ),
      TaskStatus.completed => (
          bgColor: const Color(0xFFE8F5E9),
          textColor: const Color(0xFF2E7D32),
        ),
    };
  }
}

class _StatusDot extends StatelessWidget {
  final TaskStatus status;
  const _StatusDot({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, showPulse) = switch (status) {
      TaskStatus.pending => (const Color(0xFFF9A825), true),
      TaskStatus.inProgress => (AppColors.info, true),
      TaskStatus.escalated => (AppColors.accent, false),
      TaskStatus.completed => (AppColors.success, false),
    };

    return Stack(
      alignment: Alignment.center,
      children: [
        if (showPulse)
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final TaskStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label, icon) = switch (status) {
      TaskStatus.pending => (
          const Color(0xFFF9A825),
          'Menunggu',
          Icons.schedule_outlined,
        ),
      TaskStatus.inProgress => (
          AppColors.info,
          'Dikerjakan',
          Icons.hourglass_top,
        ),
      TaskStatus.escalated => (
          AppColors.accent,
          'Eskalasi',
          Icons.warning_amber_rounded,
        ),
      TaskStatus.completed => (
          AppColors.success,
          'Selesai',
          Icons.check_circle_outline,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color.withOpacity(0.7)),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _TypeChip extends StatelessWidget {
  final TaskType type;
  const _TypeChip({required this.type});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (color, label, icon) = switch (type) {
      TaskType.meterReading => (
          const Color(0xFF7B1FA2),
          'Meter',
          Icons.speed_outlined,
        ),
      TaskType.pipeInspection => (
          AppColors.secondary,
          'Inspeksi',
          Icons.visibility_outlined,
        ),
      TaskType.repair => (
          AppColors.accent,
          'Perbaikan',
          Icons.build_outlined,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotesCard extends StatelessWidget {
  final String notes;
  const _NotesCard({required this.notes});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.note_alt_outlined,
            size: 14,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              notes,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
