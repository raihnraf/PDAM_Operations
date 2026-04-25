import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/officer_profile.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileCubit>()..loadProfile(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return switch (state) {
              ProfileLoading() => const LoadingIndicator(),
              ProfileLoaded() => _ProfileContent(profile: state.profile),
              ProfileError() => ErrorStateView(
                message: state.message,
                onRetry: () => context.read<ProfileCubit>().loadProfile(),
              ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final OfficerProfile profile;

  const _ProfileContent({required this.profile});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProfileHeader(
            name: profile.name,
            role: profile.role,
            id: profile.id,
            unit: profile.unit,
            isOnDuty: profile.isOnDuty,
            onSync: () => HapticHelper.selection(),
            onEdit: () => HapticHelper.selection(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: AppSpacing.allMd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileQuickInfoRow(),
                const SizedBox(height: 16),
                ProfileStatsGrid(profile: profile),
                const SizedBox(height: 16),
                const ProfileActivitySection(),
                const SizedBox(height: 16),
                const ProfileSettingsList(),
                const SizedBox(height: 16),
                const ProfileActionButtons(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
