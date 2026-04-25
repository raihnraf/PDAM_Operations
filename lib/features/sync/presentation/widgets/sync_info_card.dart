import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_shadow.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../bloc/sync_cubit.dart';
import '../bloc/sync_state.dart';

class SyncInfoCard extends StatelessWidget {
  const SyncInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        final pendingCount =
            state is SyncLoaded ? state.pendingReports.length : 0;
        final lastSync = state is SyncLoaded ? state.lastSyncTime : null;

        return Container(
          padding: AppSpacing.allMd,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: AppRadius.xlBorder,
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppShadow.cardShadow,
                blurRadius: 12,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              SyncInfoRow(
                icon: Icons.sync,
                label: AppStrings.syncLastSync,
                value: lastSync != null
                    ? _formatLastSync(lastSync)
                    : AppStrings.syncNeverSynced,
                valueColor: lastSync != null
                    ? AppColors.secondary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const Divider(height: 24),
              SyncInfoRow(
                icon: Icons.folder_outlined,
                label: AppStrings.syncTotalReports,
                value: '$pendingCount ${AppStrings.syncReportsSuffix}',
                valueColor: AppColors.primary,
              ),
              const Divider(height: 24),
              SyncInfoRow(
                icon: Icons.wifi_off_outlined,
                label: AppStrings.syncConnectionStatus,
                value: AppStrings.syncOffline,
                valueColor: AppColors.accent,
              ),
            ],
          ),
        );
      },
    );
  }

  static String _formatLastSync(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) return AppStrings.syncJustNow;
    if (diff.inMinutes < 60) return '${diff.inMinutes} ${AppStrings.syncMinutesAgo}';
    if (diff.inHours < 24) return '${diff.inHours} ${AppStrings.syncHoursAgo}';
    if (diff.inDays == 1) return AppStrings.syncYesterday;
    return '${diff.inDays} ${AppStrings.syncDaysAgo}';
  }
}

class SyncInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color valueColor;

  const SyncInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: valueColor.withAlpha(26),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 20,
            color: valueColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
