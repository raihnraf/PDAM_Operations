import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/officer_profile.dart';

class ProfileStatsGrid extends StatelessWidget {
  final OfficerProfile profile;

  const ProfileStatsGrid({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.profileStats,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ProfileStatCard(
                icon: Icons.check_circle_outline,
                title: AppStrings.profileTasksCompleted,
                value: profile.tasksCompleted.toString(),
                subtitle: '+${profile.tasksThisWeek} ${AppStrings.profileWeekSuffix}',
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ProfileStatCard(
                icon: Icons.schedule_outlined,
                title: AppStrings.profileHoursField,
                value: '${profile.hoursInField}h',
                subtitle: AppStrings.profileYearSuffix,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ProfileStatCard(
          icon: Icons.trending_up_outlined,
          title: AppStrings.profileEfficiency,
          value: '${profile.efficiencyScore}%',
          subtitle: profile.efficiencyScore >= 90 ? AppStrings.profileTop10 : AppStrings.profileNeedsImprovement,
          color: profile.efficiencyScore >= 90 ? AppColors.success : AppColors.accent,
        ),
      ],
    );
  }
}

class ProfileStatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;

  const ProfileStatCard({
    super.key,
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
      padding: AppSpacing.allMd,
      decoration: _cardDecoration(theme),
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

BoxDecoration _cardDecoration(ThemeData theme) => BoxDecoration(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: theme.colorScheme.outlineVariant,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: const Color(0x0A000000),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
