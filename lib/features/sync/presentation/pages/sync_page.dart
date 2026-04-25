import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../injection_container.dart';
import '../bloc/sync_cubit.dart';
import '../bloc/sync_state.dart';
import '../widgets/widgets.dart';

class SyncPage extends StatelessWidget {
  const SyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SyncCubit>()..loadData(),
      child: const _SyncView(),
    );
  }
}

class _SyncView extends StatelessWidget {
  const _SyncView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SyncHeader(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: AppSpacing.horizontalMd,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SyncStatusBanner(),
                        const SizedBox(height: 20),
                        const SyncInfoCard(),
                        const SizedBox(height: 12),
                        const SyncActionCard(),
                        const _ErrorBannerSlot(),
                        const SizedBox(height: 24),
                        const SyncPendingListHeader(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SyncPendingListSliver(),
          ],
        ),
      ),
    );
  }
}

class _ErrorBannerSlot extends StatelessWidget {
  const _ErrorBannerSlot();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        if (state is! SyncLoaded || state.syncError == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SyncErrorBanner(message: state.syncError!),
        );
      },
    );
  }
}

class SyncErrorBanner extends StatelessWidget {
  final String message;

  const SyncErrorBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.errorOverlay10,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.errorOverlay30),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            size: 20,
            color: AppColors.error,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
