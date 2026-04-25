import 'package:flutter/material.dart';

class TaskInfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool expandLabel;

  const TaskInfoChip({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.expandLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      maxLines: expandLabel ? 1 : null,
      overflow: expandLabel ? TextOverflow.ellipsis : TextOverflow.clip,
    );

    return Row(
      children: [
        Icon(icon, size: 14, color: color.withOpacity(0.7)),
        const SizedBox(width: 4),
        if (expandLabel) Expanded(child: text) else text,
      ],
    );
  }
}
