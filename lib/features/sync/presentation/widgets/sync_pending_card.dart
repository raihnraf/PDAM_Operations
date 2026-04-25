import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_shadow.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../damage_report/domain/entities/damage_report.dart';
import '../../../damage_report/domain/entities/damage_report_labels.dart';
import '../bloc/sync_cubit.dart';
import '../bloc/sync_state.dart';
import '../../domain/entities/pending_report.dart';

class SyncPendingListHeader extends StatelessWidget {
  const SyncPendingListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        final count = state is SyncLoaded ? state.pendingReports.length : 0;
        if (count == 0) return const SizedBox.shrink();

        return Row(
          children: [
            Icon(
              Icons.pending_actions_outlined,
              size: 22,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 10),
            Text(
              AppStrings.syncPendingHeader,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryOverlay10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$count',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SyncPendingListSliver extends StatelessWidget {
  const SyncPendingListSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        final reports =
            state is SyncLoaded ? state.pendingReports : <PendingReport>[];

        if (reports.isEmpty) {
          return const SliverToBoxAdapter(child: SyncEmptyState());
        }

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final report = reports[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SyncPendingCard(report: report),
                );
              },
              childCount: reports.length,
            ),
          ),
        );
      },
    );
  }
}

class SyncEmptyState extends StatelessWidget {
  const SyncEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryOverlay10,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.cloud_done_outlined,
                size: 56,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.syncAllSynced,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              AppStrings.syncNoPending,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SyncPendingCard extends StatelessWidget {
  final PendingReport report;

  const SyncPendingCard({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final severityColor = _getSeverityColor(report.type);

    return Container(
      decoration: _cardDecoration(theme),
      child: ClipRRect(
        borderRadius: AppRadius.lgBorder,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: AppSpacing.allMd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: severityColor.withAlpha(26),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          _getIconForType(report.type),
                          color: severityColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              report.title,
                              style: AppTextStyles.titleMedium.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatType(report.type),
                              style: AppTextStyles.labelSmall.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentOverlay10,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.accentOverlay30,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.save_outlined,
                              size: 12,
                              color: AppColors.accent,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              AppStrings.syncLocal,
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatSavedTime(report.savedAt),
                        style: AppTextStyles.labelSmall.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Color _getSeverityColor(DamageType type) {
    return switch (type) {
      DamageType.burst => AppColors.error,
      DamageType.leak => AppColors.accent,
      DamageType.corrosion => AppColors.warning,
      _ => AppColors.secondary,
    };
  }

  static IconData _getIconForType(DamageType type) {
    return switch (type) {
      DamageType.leak => Icons.water_drop_outlined,
      DamageType.burst => Icons.auto_fix_high_outlined,
      DamageType.corrosion => Icons.science_outlined,
      DamageType.blockage => Icons.block_outlined,
      _ => Icons.build_outlined,
    };
  }

  static String _formatType(DamageType type) => type.label;

  static String _formatSavedTime(DateTime savedAt) {
    return DateFormatter.formatRelative(savedAt);
  }
}

BoxDecoration _cardDecoration(ThemeData theme) => BoxDecoration(
      color: theme.colorScheme.surface,
      borderRadius: AppRadius.lgBorder,
      border: Border.all(
        color: theme.colorScheme.outlineVariant,
        width: 1,
      ),
      boxShadow: AppShadow.card,
    );
