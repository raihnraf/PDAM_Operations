import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/utils/task_status_config.dart';
import '../../../../core/widgets/widgets.dart';
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

    return Semantics(
      label: 'Tugas ${task.customerName}. ${_taskTitle(task)}. Status: ${_statusLabel(task.status)}. Geser kanan untuk selesai, geser kiri untuk eskalasi.',
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withAlpha(128),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackOverlay06,
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
                    padding: AppSpacing.allMd,
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
                        TaskInfoChip(
                          icon: Icons.location_on_outlined,
                          label: task.address,
                          color: theme.colorScheme.primary,
                          expandLabel: true,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: TaskInfoChip(
                                icon: Icons.calendar_today_outlined,
                                label: _formatDate(task.scheduledDate),
                                color: theme.colorScheme.onSurfaceVariant,
                                expandLabel: true,
                              ),
                            ),
                            const SizedBox(width: 8),
                            TaskTypeChip(type: task.type),
                          ],
                        ),
                        if (task.notes != null && task.notes!.isNotEmpty) ...[
                          const SizedBox(height: 10),
                          _NotesCard(notes: task.notes!),
                        ],
                        _ActingProgressIndicator(taskId: task.id),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

  String _statusLabel(TaskStatus status) {
    return switch (status) {
      TaskStatus.pending => AppStrings.statusPending,
      TaskStatus.inProgress => AppStrings.statusInProgress,
      TaskStatus.escalated => AppStrings.statusEscalated,
      TaskStatus.completed => AppStrings.statusCompleted,
    };
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final statusConfig = taskStatusConfig(task.status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: statusConfig.bgColor,
        border: Border(
          bottom: BorderSide(
            color: statusConfig.bgColor.withAlpha(128),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          TaskStatusDot(status: task.status),
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
          TaskStatusBadge(status: task.status),
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
    return DateFormatter.formatDate(date);
  }
}

class _ActingProgressIndicator extends StatelessWidget {
  final String taskId;
  const _ActingProgressIndicator({required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TaskListCubit, TaskListState, String?>(
      selector: (state) => state is TaskListLoaded ? state.actingTaskId : null,
      builder: (context, actingTaskId) {
        if (actingTaskId == taskId) {
          return const Padding(
            padding: EdgeInsets.only(top: 12),
            child: LinearProgressIndicator(),
          );
        }
        return const SizedBox.shrink();
      },
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
          color: theme.colorScheme.outlineVariant.withAlpha(77),
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
