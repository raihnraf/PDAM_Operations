import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/haptic_helper.dart';

class ProfileActivitySection extends StatelessWidget {
  const ProfileActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.profileActivity,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => HapticHelper.selection(),
              child: Text(AppStrings.profileSeeAll),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ..._mockActivities.map((a) => ProfileActivityTile(activity: a)),
      ],
    );
  }

  static const _mockActivities = [
    ProfileActivity(
      icon: Icons.check_circle,
      title: AppStrings.activityTaskCompleted,
      subtitle: 'Pembacaan Meter - Jl. Raya Gubeng No. 42',
      time: '2 jam lalu',
      color: AppColors.success,
    ),
    ProfileActivity(
      icon: Icons.warning_amber_rounded,
      title: AppStrings.activityEscalation,
      subtitle: 'Pipa Bocor - Perumahan PAM Surabaya',
      time: '5 jam lalu',
      color: AppColors.accent,
    ),
    ProfileActivity(
      icon: Icons.upload_file,
      title: AppStrings.activityReportSent,
      subtitle: 'Korosi Valve V-8942 Kec. Wonokromo',
      time: AppStrings.dateYesterday,
      color: AppColors.primary,
    ),
  ];
}

class ProfileActivity {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const ProfileActivity({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });
}

class ProfileActivityTile extends StatelessWidget {
  final ProfileActivity activity;

  const ProfileActivityTile({super.key, required this.activity});

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
              color: activity.color.withAlpha(26),
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
