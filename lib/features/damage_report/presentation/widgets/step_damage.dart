import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../domain/entities/damage_report.dart';
import '../../domain/entities/damage_report_labels.dart';
import '../bloc/damage_report_cubit.dart';
import '../bloc/damage_report_state.dart';

class StepDamage extends StatelessWidget {
  const StepDamage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<DamageReportCubit, DamageReportState>(
      builder: (context, state) {
        final damageType = _getDamageType(context, state);
        final severity = _getSeverity(context, state);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jenis Kerusakan', style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: DamageType.values.map((type) {
                final isSelected = type == damageType;
                return ChoiceChip(
                  label: Text(type.label),
                  selected: isSelected,
                  onSelected: (_) {
                    HapticHelper.selection();
                    context.read<DamageReportCubit>().setDamageType(type);
                  },
                  selectedColor: theme.colorScheme.primaryContainer,
                  checkmarkColor: theme.colorScheme.onPrimaryContainer,
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text('Tingkat Keparahan', style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            SegmentedButton<DamageSeverity>(
              segments: DamageSeverity.values.map((s) {
                return ButtonSegment(
                  value: s,
                  label: Text(s.severityLabel),
                  icon: Icon(s.severityIcon),
                );
              }).toList(),
              selected: {severity},
              onSelectionChanged: (set) {
                HapticHelper.selection();
                context.read<DamageReportCubit>().setSeverity(set.first);
              },
              emptySelectionAllowed: false,
            ),
          ],
        );
      },
    );
  }

  DamageType _getDamageType(BuildContext context, DamageReportState state) {
    if (state is DamageReportFormUpdated) return state.damageType;
    return context.read<DamageReportCubit>().damageType;
  }

  DamageSeverity _getSeverity(BuildContext context, DamageReportState state) {
    if (state is DamageReportFormUpdated) return state.severity;
    return context.read<DamageReportCubit>().severity;
  }
}
