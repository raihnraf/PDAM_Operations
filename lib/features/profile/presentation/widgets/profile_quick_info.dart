import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_spacing.dart';

class ProfileQuickInfoRow extends StatelessWidget {
  const ProfileQuickInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: AppSpacing.allMd,
      decoration: _cardDecoration(theme),
      child: const Row(
        children: [
          ProfileQuickInfoItem(
            icon: Icons.calendar_today_outlined,
            label: AppStrings.profileJoined,
            value: 'Jan 2024',
            color: AppColors.secondary,
          ),
          SizedBox(width: 16),
          ProfileQuickInfoItem(
            icon: Icons.verified_outlined,
            label: AppStrings.profileCertification,
            value: AppStrings.profileCertActive,
            color: AppColors.success,
          ),
          SizedBox(width: 16),
          ProfileQuickInfoItem(
            icon: Icons.phone_outlined,
            label: AppStrings.profileContact,
            value: AppStrings.profileDispatch,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class ProfileQuickInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const ProfileQuickInfoItem({
    super.key,
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
