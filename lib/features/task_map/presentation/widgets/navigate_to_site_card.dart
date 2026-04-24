import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../domain/entities/task.dart';

class NavigateToSiteCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;

  const NavigateToSiteCard({
    super.key,
    required this.task,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusConfig = _statusConfig(task.status);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: statusConfig.borderColor.withOpacity(0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, statusConfig),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.address,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _InfoChip(
                        icon: Icons.calendar_today_outlined,
                        label: _formatDate(task.scheduledDate),
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      _TypeChip(type: task.type),
                    ],
                  ),
                  if (task.notes != null && task.notes!.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _NotesPreview(notes: task.notes!),
                  ],
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton.icon(
                      onPressed: () {
                        HapticHelper.confirm();
                        _showNavigateDialog(context);
                      },
                      icon: const Icon(Icons.navigation, size: 20),
                      label: const Text(
                        'Navigasi ke Lokasi',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ({Color bgColor, Color borderColor, Color textColor}) statusConfig) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: statusConfig.bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          _StatusDot(status: task.status),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'ID: ${task.id.toUpperCase()}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: statusConfig.textColor,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _StatusBadge(status: task.status),
        ],
      ),
    );
  }

  ({Color bgColor, Color borderColor, Color textColor}) _statusConfig(TaskStatus status) {
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

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }

  void _showNavigateDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.navigation, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            const Text('Navigasi ke Lokasi'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.address,
              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Lat: ${task.latitude.toStringAsFixed(4)}, Lon: ${task.longitude.toStringAsFixed(4)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Rute akan dibuka di aplikasi peta eksternal.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal', style: TextStyle(color: theme.colorScheme.onSurfaceVariant)),
          ),
          FilledButton.icon(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: theme.colorScheme.onPrimary),
                      const SizedBox(width: 8),
                      const Text('Membuka navigasi...'),
                    ],
                  ),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              );
            },
            icon: const Icon(Icons.map, size: 18),
            label: const Text('Buka'),
          ),
        ],
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  final TaskStatus status;
  const _StatusDot({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, showPulse) = switch (status) {
      TaskStatus.pending => (const Color(0xFFF9A825), true),
      TaskStatus.inProgress => (AppColors.info, true),
      TaskStatus.escalated => (AppColors.accent, false),
      TaskStatus.completed => (AppColors.success, false),
    };

    return Stack(
      alignment: Alignment.center,
      children: [
        if (showPulse)
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final TaskStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label, icon) = switch (status) {
      TaskStatus.pending => (
          const Color(0xFFF9A825),
          'Menunggu',
          Icons.schedule_outlined,
        ),
      TaskStatus.inProgress => (
          AppColors.info,
          'Dikerjakan',
          Icons.hourglass_top,
        ),
      TaskStatus.escalated => (
          AppColors.accent,
          'Eskalasi',
          Icons.warning_amber_rounded,
        ),
      TaskStatus.completed => (
          AppColors.success,
          'Selesai',
          Icons.check_circle_outline,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color.withOpacity(0.7)),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _TypeChip extends StatelessWidget {
  final TaskType type;
  const _TypeChip({required this.type});

  @override
  Widget build(BuildContext context) {
    final (color, label, icon) = switch (type) {
      TaskType.meterReading => (
          const Color(0xFF7B1FA2),
          'Meter',
          Icons.speed_outlined,
        ),
      TaskType.pipeInspection => (
          AppColors.secondary,
          'Inspeksi',
          Icons.visibility_outlined,
        ),
      TaskType.repair => (
          AppColors.accent,
          'Perbaikan',
          Icons.build_outlined,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotesPreview extends StatelessWidget {
  final String notes;
  const _NotesPreview({required this.notes});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.note_alt_outlined,
            size: 14,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              notes,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
