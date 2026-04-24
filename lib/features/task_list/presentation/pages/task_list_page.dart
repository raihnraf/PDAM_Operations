import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../injection_container.dart';
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
            TaskListError() => _ErrorView(message: state.message),
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
    final cubit = context.read<TaskListCubit>();
    final tasks = cubit.getFilteredTasks();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: FilterToggle(),
        ),
        Expanded(
          child: tasks.isEmpty
              ? _EmptyView()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: tasks.length,
                  itemBuilder: (_, i) => TaskCard(task: tasks[i]),
                ),
        ),
      ],
    );
  }
}

class _EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
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
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
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
