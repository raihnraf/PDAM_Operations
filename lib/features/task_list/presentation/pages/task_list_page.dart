import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../routing/app_routes.dart';
import '../../../task_map/domain/entities/task.dart';
import '../bloc/task_list_cubit.dart';
import '../bloc/task_list_state.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskListCubit(context.read())..loadTasks(),
      child: const _TaskListView(),
    );
  }
}

class _TaskListView extends StatelessWidget {
  const _TaskListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.taskListTitle)),
      body: BlocBuilder<TaskListCubit, TaskListState>(
        builder: (context, state) {
          return switch (state) {
            TaskListLoading() => const LoadingIndicator(),
            TaskListLoaded() => _TaskList(tasks: state.tasks),
            TaskListError() => _ErrorView(message: state.message),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _TaskList extends StatelessWidget {
  final List<Task> tasks;

  const _TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_outline, size: 64, color: AppColors.textHint),
            const SizedBox(height: 16),
            Text(AppStrings.noTasks, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      itemBuilder: (_, i) => _TaskTile(task: tasks[i]),
    );
  }
}

class _TaskTile extends StatelessWidget {
  final Task task;

  const _TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
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
        child: ListTile(
          onTap: () {
            HapticHelper.selection();
            context.push(AppRoutes.damageReport, extra: task.id);
          },
          leading: CircleAvatar(
            backgroundColor: _statusColor(task.status),
            child: Icon(_statusIcon(task.status), color: Colors.white, size: 20),
          ),
          title: Text(task.customerName, style: Theme.of(context).textTheme.titleMedium),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(task.address, maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(_typeLabel(task.type), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
            ],
          ),
          trailing: _statusBadge(task.status),
        ),
      ),
    );
  }

  Widget _swipeBackground(BuildContext context, DismissDirection direction) {
    final isComplete = direction == DismissDirection.startToEnd;
    return Container(
      color: isComplete ? AppColors.success : AppColors.accent,
      alignment: isComplete ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Icon(
        isComplete ? Icons.check : Icons.arrow_upward,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  Color _statusColor(TaskStatus status) {
    return switch (status) {
      TaskStatus.pending => AppColors.textHint,
      TaskStatus.inProgress => AppColors.info,
      TaskStatus.completed => AppColors.success,
      TaskStatus.escalated => AppColors.accent,
    };
  }

  IconData _statusIcon(TaskStatus status) {
    return switch (status) {
      TaskStatus.pending => Icons.schedule,
      TaskStatus.inProgress => Icons.hourglass_top,
      TaskStatus.completed => Icons.check,
      TaskStatus.escalated => Icons.warning,
    };
  }

  Widget _statusBadge(TaskStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _statusColor(status).withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _statusLabel(status),
        style: TextStyle(color: _statusColor(status), fontSize: 12, fontWeight: FontWeight.w500),
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

  String _statusLabel(TaskStatus status) {
    return switch (status) {
      TaskStatus.pending => 'Menunggu',
      TaskStatus.inProgress => 'Dikerjakan',
      TaskStatus.completed => 'Selesai',
      TaskStatus.escalated => 'Eskalasi',
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
            onPressed: () => context.read<TaskListCubit>().loadTasks(),
          ),
        ],
      ),
    );
  }
}
