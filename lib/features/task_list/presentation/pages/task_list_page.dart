import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../injection_container.dart';
import '../../../task_map/domain/entities/task.dart';
import '../bloc/task_list_cubit.dart';
import '../bloc/task_list_state.dart';
import '../widgets/widgets.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TaskListCubit>()..loadTasks(),
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
            TaskListLoaded() => const _TaskListContent(),
            TaskListError() => ErrorStateView(
              message: state.message,
              onRetry: () => context.read<TaskListCubit>().loadTasks(),
            ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _TaskListContent extends StatelessWidget {
  const _TaskListContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: AppSpacing.allMd,
          child: FilterToggle(),
        ),
        Expanded(
          child: BlocSelector<TaskListCubit, TaskListState, List<Task>>(
            selector: (state) {
              if (state is! TaskListLoaded) return [];
              return switch (state.activeFilter) {
                TaskFilter.pending => state.tasks
                    .where((t) =>
                        t.status == TaskStatus.pending ||
                        t.status == TaskStatus.inProgress ||
                        t.status == TaskStatus.escalated)
                    .toList(),
                TaskFilter.completed =>
                  state.tasks.where((t) => t.status == TaskStatus.completed).toList(),
              };
            },
            builder: (context, tasks) {
              if (tasks.isEmpty) return const _EmptyView();
              return ListView.builder(
                padding: AppSpacing.horizontalMd,
                itemCount: tasks.length,
                itemBuilder: (_, i) => TaskCard(task: tasks[i]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: AppSpacing.allXl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: AppSpacing.allLg,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.task_alt,
                size: 56,
                color: theme.colorScheme.primary.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.noTasks,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tugas yang sudah diselesaikan akan muncul di tab "Selesai"',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
