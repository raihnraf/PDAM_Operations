import 'package:flutter/material.dart';
import '../../features/task_map/domain/entities/task.dart';
import '../utils/task_status_config.dart';

class TaskStatusDot extends StatelessWidget {
  final TaskStatus status;
  const TaskStatusDot({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (:color, :showPulse) = taskStatusDotConfig(status);

    return Stack(
      alignment: Alignment.center,
      children: [
        if (showPulse)
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color.withAlpha(51),
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
