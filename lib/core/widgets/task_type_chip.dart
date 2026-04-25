import 'package:flutter/material.dart';
import '../../features/task_map/domain/entities/task.dart';
import '../utils/task_status_config.dart';

class TaskTypeChip extends StatelessWidget {
  final TaskType type;
  const TaskTypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final (:color, :label, :icon) = taskTypeChipConfig(type);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withAlpha(77)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 3),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
