import 'package:flutter/material.dart';
import '../constants/constants.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBg = backgroundColor ?? theme.colorScheme.primary;
    final effectiveText = textColor ?? theme.colorScheme.onPrimary;

    final child = _buildChild(theme, effectiveBg);

    if (isOutlined) {
      return Semantics(
        button: true,
        label: label,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
          ),
          child: child,
        ),
      );
    }

    return Semantics(
      button: true,
      label: label,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: effectiveBg,
          foregroundColor: effectiveText,
          minimumSize: const Size(double.infinity, 48),
        ),
        child: child,
      ),
    );
  }

  Widget _buildChild(ThemeData theme, Color bg) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            isOutlined ? bg : theme.colorScheme.onPrimary,
          ),
        ),
      );
    }
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.button,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
    return Text(
      label,
      style: AppTextStyles.button,
      textAlign: TextAlign.center,
    );
  }
}
