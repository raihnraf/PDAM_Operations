import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/damage_report.dart';
import '../../domain/entities/damage_report_labels.dart';
import '../bloc/damage_report_cubit.dart';
import '../bloc/damage_report_state.dart';

class StepReview extends StatelessWidget {
  const StepReview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<DamageReportCubit, DamageReportState>(
      builder: (context, state) {
        final reporterName =
            state is DamageReportFormUpdated ? state.reporterName : '';
        final damageType =
            state is DamageReportFormUpdated ? state.damageType : DamageType.leak;
        final severity = state is DamageReportFormUpdated
            ? state.severity
            : DamageSeverity.medium;
        final description =
            state is DamageReportFormUpdated ? state.description : '';
        final latitude =
            state is DamageReportFormUpdated ? state.latitude : null;
        final longitude =
            state is DamageReportFormUpdated ? state.longitude : null;
        final photos =
            state is DamageReportFormUpdated ? state.photoPaths : [];

        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          padding: AppSpacing.allMd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _reviewRow(theme, 'Petugas', reporterName),
              const Divider(),
              _reviewRow(theme, 'Jenis', damageType.label),
              const Divider(),
              _reviewRow(
                theme,
                'Keparahan',
                severity.severityLabel,
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: severity.severityColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    severity.severityLabel,
                    style: TextStyle(
                      color: severity.severityColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Divider(),
              _reviewRow(
                theme,
                'Lokasi',
                latitude != null && longitude != null
                    ? '${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}'
                    : 'Belum ditentukan',
              ),
              const Divider(),
              _reviewRow(theme, 'Deskripsi', description),
              if (photos.isNotEmpty) ...[
                const Divider(),
                _reviewRow(
                    theme, 'Foto', '${photos.length} foto terlampir'),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _reviewRow(ThemeData theme, String label, String value,
      {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: trailing ?? Text(value, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
