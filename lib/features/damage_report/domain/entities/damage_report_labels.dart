import 'package:flutter/material.dart';
import 'damage_report.dart';
import '../../../../core/constants/app_colors.dart';

extension DamageTypeLabels on DamageType {
  String get label => switch (this) {
        DamageType.leak => 'Kebocoran',
        DamageType.burst => 'Pipa Pecah',
        DamageType.corrosion => 'Korosi',
        DamageType.blockage => 'Penyumbatan',
        DamageType.other => 'Lainnya',
      };
}

extension DamageSeverityLabels on DamageSeverity {
  String get severityLabel => switch (this) {
        DamageSeverity.low => 'Rendah',
        DamageSeverity.medium => 'Sedang',
        DamageSeverity.high => 'Tinggi',
        DamageSeverity.critical => 'Kritis',
      };

  IconData get severityIcon => switch (this) {
        DamageSeverity.low => Icons.info_outline,
        DamageSeverity.medium => Icons.warning_outlined,
        DamageSeverity.high => Icons.error_outline,
        DamageSeverity.critical => Icons.warning_amber_rounded,
      };

  Color get severityColor => switch (this) {
        DamageSeverity.low => AppColors.info,
        DamageSeverity.medium => AppColors.warning,
        DamageSeverity.high => AppColors.accent,
        DamageSeverity.critical => AppColors.error,
      };
}
