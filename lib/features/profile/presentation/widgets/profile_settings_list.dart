import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/haptic_helper.dart';

class ProfileSettingsList extends StatelessWidget {
  const ProfileSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: _cardDecoration(theme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Text(
              AppStrings.profileSettings,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 1),
          ..._settingsItems.map(
            (item) => ProfileSettingsTile(
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
    ProfileSettingsItem(
      icon: Icons.manage_accounts_outlined,
      title: AppStrings.profileAccountSettings,
      subtitle: AppStrings.profileAccountSubtitle,
    ),
    ProfileSettingsItem(
      icon: Icons.notifications_active_outlined,
      title: AppStrings.profileNotifications,
      subtitle: AppStrings.profileNotificationsSubtitle,
    ),
    ProfileSettingsItem(
      icon: Icons.download_for_offline_outlined,
      title: AppStrings.profileOfflineData,
      subtitle: AppStrings.profileOfflineDataSubtitle,
    ),
    ProfileSettingsItem(
      icon: Icons.language_outlined,
      title: AppStrings.profileLanguage,
      subtitle: AppStrings.profileLanguageValue,
    ),
  ];
}

class ProfileSettingsItem {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileSettingsItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class ProfileSettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileSettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

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
