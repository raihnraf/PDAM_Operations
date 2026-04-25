import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../bloc/sync_cubit.dart';
import '../bloc/sync_state.dart';

class SyncActionCard extends StatelessWidget {
  const SyncActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        final pendingCount =
            state is SyncLoaded ? state.pendingReports.length : 0;
        final isSyncing = state is SyncLoaded && state.isSyncing;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryOverlay05,
                AppColors.primaryOverlay02,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primaryOverlay20,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOverlay10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.upload_file_outlined,
                      size: 20,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    AppStrings.syncPendingReports,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$pendingCount',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    AppStrings.syncReportsReady,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: AppButton(
                  label: isSyncing ? AppStrings.syncButtonSyncing : AppStrings.syncButton,
                  onPressed:
                      isSyncing || pendingCount == 0
                          ? null
                          : () {
                              context.read<SyncCubit>().syncAll();
                            },
                  isLoading: isSyncing,
                  icon: isSyncing ? null : Icons.sync,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
