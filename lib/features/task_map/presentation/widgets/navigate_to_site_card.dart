import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/utils/task_status_config.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/task.dart';

class NavigateToSiteCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;

  const NavigateToSiteCard({
    super.key,
    required this.task,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusConfig = taskStatusConfig(task.status);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: statusConfig.borderColor.withAlpha(77),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackOverlay10,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, statusConfig),
            const Divider(height: 1),
            Padding(
              padding: AppSpacing.allMd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.address,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      TaskInfoChip(
                        icon: Icons.calendar_today_outlined,
                        label: _formatDate(task.scheduledDate),
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      TaskTypeChip(type: task.type),
                    ],
                  ),
                  if (task.notes != null && task.notes!.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _NotesPreview(notes: task.notes!),
                  ],
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton.icon(
                      onPressed: () {
                        HapticHelper.confirm();
                        _showNavigateDialog(context);
                      },
                      icon: const Icon(Icons.navigation, size: 20),
                      label: Text(
                        AppStrings.navigateToSite,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, TaskStatusStyle statusConfig) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: statusConfig.bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
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

  String _formatDate(DateTime date) {
    return DateFormatter.formatDate(date);
  }

  void _showNavigateDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.navigation, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            const Text(AppStrings.navigateToSite),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.address,
              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Lat: ${task.latitude.toStringAsFixed(4)}, Lon: ${task.longitude.toStringAsFixed(4)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      AppStrings.navigateRouteInfo,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppStrings.cancel, style: TextStyle(color: theme.colorScheme.onSurfaceVariant)),
          ),
          FilledButton.icon(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: theme.colorScheme.onPrimary),
                      const SizedBox(width: 8),
                      const Text(AppStrings.navigateOpening),
                    ],
                  ),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              );
            },
            icon: const Icon(Icons.map, size: 18),
            label: const Text(AppStrings.navigateOpen),
          ),
        ],
      ),
    );
  }
}

class _NotesPreview extends StatelessWidget {
  final String notes;
  const _NotesPreview({required this.notes});

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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
