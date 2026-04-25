import 'package:flutter/material.dart';
import '../../features/task_map/domain/entities/task.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

typedef TaskStatusStyle = ({
  Color bgColor,
  Color borderColor,
  Color textColor,
});

TaskStatusStyle taskStatusConfig(TaskStatus status) {
  return switch (status) {
    TaskStatus.pending => (
        bgColor: const Color(0xFFFFF8E1),
        borderColor: const Color(0xFFF9A825),
        textColor: const Color(0xFF7A6500),
      ),
    TaskStatus.inProgress => (
        bgColor: const Color(0xFFE3F2FD),
        borderColor: AppColors.info,
        textColor: const Color(0xFF1565C0),
      ),
    TaskStatus.escalated => (
        bgColor: const Color(0xFFFFF3E0),
        borderColor: AppColors.accent,
        textColor: const Color(0xFFE65100),
      ),
    TaskStatus.completed => (
        bgColor: const Color(0xFFE8F5E9),
        borderColor: AppColors.success,
        textColor: const Color(0xFF2E7D32),
      ),
  };
}

typedef TaskStatusDotStyle = ({
  Color color,
  bool showPulse,
});

TaskStatusDotStyle taskStatusDotConfig(TaskStatus status) {
  return switch (status) {
    TaskStatus.pending => (color: const Color(0xFFF9A825), showPulse: true),
    TaskStatus.inProgress => (color: AppColors.info, showPulse: true),
    TaskStatus.escalated => (color: AppColors.accent, showPulse: false),
    TaskStatus.completed => (color: AppColors.success, showPulse: false),
  };
}

typedef TaskStatusBadgeStyle = ({
  Color color,
  String label,
  IconData icon,
});

TaskStatusBadgeStyle taskStatusBadgeConfig(TaskStatus status) {
  return switch (status) {
    TaskStatus.pending => (
        color: const Color(0xFFF9A825),
        label: AppStrings.statusPending,
        icon: Icons.schedule_outlined,
      ),
    TaskStatus.inProgress => (
        color: AppColors.info,
        label: AppStrings.statusInProgress,
        icon: Icons.hourglass_top,
      ),
    TaskStatus.escalated => (
        color: AppColors.accent,
        label: AppStrings.statusEscalated,
        icon: Icons.warning_amber_rounded,
      ),
    TaskStatus.completed => (
        color: AppColors.success,
        label: AppStrings.statusCompleted,
        icon: Icons.check_circle_outline,
      ),
  };
}

typedef TaskTypeChipStyle = ({
  Color color,
  String label,
  IconData icon,
});

TaskTypeChipStyle taskTypeChipConfig(TaskType type) {
  return switch (type) {
    TaskType.meterReading => (
        color: const Color(0xFF7B1FA2),
        label: 'Meter',
        icon: Icons.speed_outlined,
      ),
    TaskType.pipeInspection => (
        color: AppColors.secondary,
        label: 'Inspeksi',
        icon: Icons.visibility_outlined,
      ),
    TaskType.repair => (
        color: AppColors.accent,
        label: 'Perbaikan',
        icon: Icons.build_outlined,
      ),
  };
}
