import 'package:flutter/material.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String> stepLabels;

  const StepperIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepLabels,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressWidth = currentStep / (totalSteps - 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Laporan Kerusakan',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        Stack(
          children: [
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progressWidth,
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(totalSteps, (index) {
                final isActive = index <= currentStep;
                final isCurrent = index == currentStep;
                return _StepCircle(
                  step: index + 1,
                  label: stepLabels[index],
                  isActive: isActive,
                  isCurrent: isCurrent,
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

class _StepCircle extends StatelessWidget {
  final int step;
  final String label;
  final bool isActive;
  final bool isCurrent;

  const _StepCircle({
    required this.step,
    required this.label,
    required this.isActive,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isActiveOrCurrent = isActive;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isActiveOrCurrent
                ? theme.colorScheme.primary
                : theme.colorScheme.surfaceContainerHighest,
            shape: BoxShape.circle,
            border: Border.all(
              color: isCurrent
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outlineVariant,
              width: 2,
            ),
            boxShadow: isCurrent
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                color: isActiveOrCurrent
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isActiveOrCurrent
                ? theme.colorScheme.onSurface
                : theme.colorScheme.onSurfaceVariant,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }
}
