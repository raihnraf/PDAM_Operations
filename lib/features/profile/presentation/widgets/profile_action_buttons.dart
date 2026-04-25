import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/widgets/widgets.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: AppButton(
            label: AppStrings.profileContactDispatch,
            onPressed: () => HapticHelper.confirm(),
            isOutlined: true,
            icon: Icons.support_agent_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: AppButton(
            label: AppStrings.profileLogout,
            onPressed: () => HapticHelper.confirm(),
            backgroundColor: AppColors.error,
            icon: Icons.logout,
          ),
        ),
      ],
    );
  }
}
