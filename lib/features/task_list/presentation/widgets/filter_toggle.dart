import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_duration.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../bloc/task_list_cubit.dart';
import '../bloc/task_list_state.dart';

class FilterToggle extends StatelessWidget {
  const FilterToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<TaskListCubit, TaskListState>(
      builder: (context, state) {
        final activeFilter = state is TaskListLoaded
            ? state.activeFilter
            : TaskFilter.pending;

        return Container(
          padding: AppSpacing.allXs,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: _FilterButton(
                  label: AppStrings.statusPending,
                  icon: Icons.pending_outlined,
                  isActive: activeFilter == TaskFilter.pending,
                  onTap: () => context.read<TaskListCubit>().setFilter(TaskFilter.pending),
                ),
              ),
              Expanded(
                child: _FilterButton(
                  label: AppStrings.statusCompleted,
                  icon: Icons.check_circle_outline,
                  isActive: activeFilter == TaskFilter.completed,
                  onTap: () => context.read<TaskListCubit>().setFilter(TaskFilter.completed),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterButton({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: AppDuration.animationNormal,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withAlpha(77),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isActive
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
