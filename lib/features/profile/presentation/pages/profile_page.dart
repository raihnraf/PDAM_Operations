import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/officer_profile.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..loadProfile(),
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
              ProfileError() => _ErrorView(message: state.message),
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
        SliverToBoxAdapter(child: _buildHeader(context)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _QuickInfoRow(profile: profile),
                const SizedBox(height: 16),
                _StatsGrid(profile: profile),
                const SizedBox(height: 16),
                _ActivitySection(),
                const SizedBox(height: 16),
                _SettingsList(),
                const SizedBox(height: 16),
                _ActionButtons(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profil Petugas',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.cloud_sync_outlined, color: Colors.white),
                    onPressed: () => HapticHelper.selection(),
                    tooltip: 'Sinkronisasi Data',
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Colors.white),
                    onPressed: () => HapticHelper.selection(),
                    tooltip: 'Edit Profil',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const _AvatarWidget(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            profile.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _StatusBadge(isOnDuty: profile.isOnDuty),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      profile.role,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _HeaderChip(
                          icon: Icons.badge_outlined,
                          label: profile.id,
                        ),
                        const SizedBox(width: 8),
                        _HeaderChip(
                          icon: Icons.location_on_outlined,
                          label: profile.unit,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: const Icon(Icons.person, size: 36, color: Colors.white),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isOnDuty;

  const _StatusBadge({required this.isOnDuty});

  @override
  Widget build(BuildContext context) {
    final color = isOnDuty ? Colors.greenAccent : Colors.orangeAccent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 6),
          Text(
            isOnDuty ? 'Tugas' : 'Offline',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeaderChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickInfoRow extends StatelessWidget {
  final OfficerProfile profile;

  const _QuickInfoRow({required this.profile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _QuickInfoItem(
            icon: Icons.calendar_today_outlined,
            label: 'Bergabung',
            value: 'Jan 2024',
            color: AppColors.secondary,
          ),
          const SizedBox(width: 16),
          _QuickInfoItem(
            icon: Icons.verified_outlined,
            label: 'Sertifikasi',
            value: 'K3 Aktif',
            color: AppColors.success,
          ),
          const SizedBox(width: 16),
          _QuickInfoItem(
            icon: Icons.phone_outlined,
            label: 'Kontak',
            value: 'Dispatch',
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _QuickInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _QuickInfoItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: AppTextStyles.labelLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  final OfficerProfile profile;

  const _StatsGrid({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistik Kinerja',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.check_circle_outline,
                title: 'Tugas Selesai',
                value: profile.tasksCompleted.toString(),
                subtitle: '+${profile.tasksThisWeek} minggu ini',
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.schedule_outlined,
                title: 'Jam Lapangan',
                value: '${profile.hoursInField}h',
                subtitle: 'Tahun Ini',
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _StatCard(
          icon: Icons.trending_up_outlined,
          title: 'Skor Efisiensi',
          value: '${profile.efficiencyScore}%',
          subtitle: profile.efficiencyScore >= 90 ? 'Top 10%' : 'Perlu Peningkatan',
          color: profile.efficiencyScore >= 90 ? AppColors.success : AppColors.accent,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: color),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivitySection extends StatelessWidget {
  const _ActivitySection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activities = _mockActivities;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Aktivitas Terbaru',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => HapticHelper.selection(),
              child: const Text('Lihat Semua'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...activities.map((a) => _ActivityTile(activity: a)),
      ],
    );
  }

  static const _mockActivities = [
    _Activity(
      icon: Icons.check_circle,
      title: 'Tugas Selesai',
      subtitle: 'Pembacaan Meter - Jl. Raya Gubeng No. 42',
      time: '2 jam lalu',
      color: AppColors.success,
    ),
    _Activity(
      icon: Icons.warning_amber_rounded,
      title: 'Eskalasi',
      subtitle: 'Pipa Bocor - Perumahan PAM Surabaya',
      time: '5 jam lalu',
      color: AppColors.accent,
    ),
    _Activity(
      icon: Icons.upload_file,
      title: 'Laporan Terkirim',
      subtitle: 'Korosi Valve V-8942 Kec. Wonokromo',
      time: 'Kemarin',
      color: AppColors.primary,
    ),
  ];
}

class _Activity {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const _Activity({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });
}

class _ActivityTile extends StatelessWidget {
  final _Activity activity;

  const _ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(activity.icon, size: 18, color: activity.color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: AppTextStyles.labelLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  activity.subtitle,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            activity.time,
            style: AppTextStyles.labelSmall.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsList extends StatelessWidget {
  const _SettingsList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Text(
              'Pengaturan',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 1),
          ..._settingsItems.map(
            (item) => _SettingsTile(
              icon: item.icon,
              title: item.title,
              subtitle: item.subtitle,
            ),
          ),
        ],
      ),
    );
  }

  static const _settingsItems = [
    _SettingsItem(
      icon: Icons.manage_accounts_outlined,
      title: 'Pengaturan Akun',
      subtitle: 'Kelola kredensial dan informasi pribadi',
    ),
    _SettingsItem(
      icon: Icons.notifications_active_outlined,
      title: 'Notifikasi',
      subtitle: 'Alert, penugasan, dan ringkasan',
    ),
    _SettingsItem(
      icon: Icons.download_for_offline_outlined,
      title: 'Data Offline',
      subtitle: 'Frekuensi sinkronisasi dan penyimpanan',
    ),
    _SettingsItem(
      icon: Icons.language_outlined,
      title: 'Bahasa Aplikasi',
      subtitle: 'Bahasa Indonesia',
    ),
  ];
}

class _SettingsItem {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SettingsItem({required this.icon, required this.title, required this.subtitle});
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SettingsTile({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20, color: theme.colorScheme.primary),
      ),
      title: Text(title, style: theme.textTheme.labelLarge),
      subtitle: Text(subtitle, style: theme.textTheme.labelSmall),
      trailing: Icon(Icons.chevron_right, color: theme.colorScheme.outline, size: 20),
      onTap: () => HapticHelper.selection(),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: AppButton(
            label: 'Hubungi Dispatch',
            onPressed: () => HapticHelper.confirm(),
            isOutlined: true,
            icon: Icons.support_agent_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: AppButton(
            label: 'Keluar',
            onPressed: () => HapticHelper.confirm(),
            backgroundColor: AppColors.error,
            icon: Icons.logout,
          ),
        ),
      ],
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
          Text(message, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          AppButton(
            label: AppStrings.retry,
            onPressed: () => context.read<ProfileCubit>().loadProfile(),
          ),
        ],
      ),
    );
  }
}
