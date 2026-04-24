import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/damage_report.dart';
import '../bloc/damage_report_cubit.dart';
import '../bloc/damage_report_state.dart';

class StepReview extends StatelessWidget {
  final String reporterName;

  const StepReview({
    super.key,
    required this.reporterName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<DamageReportCubit, DamageReportState>(
      builder: (context, state) {
        final damageType = _getDamageType(context, state);
        final severity = _getSeverity(context, state);
        final description = _getDescription(context, state);
        final latitude = _getLatitude(context, state);
        final longitude = _getLongitude(context, state);

        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _reviewRow(theme, 'Petugas', reporterName),
              const Divider(),
              _reviewRow(theme, 'Jenis', _damageTypeLabel(damageType)),
              const Divider(),
              _reviewRow(
                theme,
                'Keparahan',
                _severityLabel(severity),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _severityColor(severity).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _severityLabel(severity),
                    style: TextStyle(
                      color: _severityColor(severity),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Divider(),
              _reviewRow(theme, 'Lokasi', '${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}'),
              const Divider(),
              _reviewRow(theme, 'Deskripsi', description),
              if (_getPhotos(context, state).isNotEmpty) ...[
                const Divider(),
                _reviewRow(theme, 'Foto', '${_getPhotos(context, state).length} foto terlampir'),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _reviewRow(ThemeData theme, String label, String value, {Widget? trailing}) {
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

  DamageType _getDamageType(BuildContext context, DamageReportState state) {
    if (state is DamageReportFormUpdated) return state.damageType;
    return context.read<DamageReportCubit>().damageType;
  }

  DamageSeverity _getSeverity(BuildContext context, DamageReportState state) {
    if (state is DamageReportFormUpdated) return state.severity;
    return context.read<DamageReportCubit>().severity;
  }

  String _getDescription(BuildContext context, DamageReportState state) {
    if (state is DamageReportFormUpdated) return state.description;
    return context.read<DamageReportCubit>().description;
  }

  double _getLatitude(BuildContext context, DamageReportState state) {
    if (state is DamageReportFormUpdated) return state.latitude;
    return context.read<DamageReportCubit>().latitude;
  }

  double _getLongitude(BuildContext context, DamageReportState state) {
    if (state is DamageReportFormUpdated) return state.longitude;
    return context.read<DamageReportCubit>().longitude;
  }

  List<String> _getPhotos(BuildContext context, DamageReportState state) {
    if (state is DamageReportFormUpdated) return state.photoPaths;
    return context.read<DamageReportCubit>().photoPaths;
  }

  String _damageTypeLabel(DamageType type) {
    return switch (type) {
      DamageType.leak => 'Kebocoran',
      DamageType.burst => 'Pipa Pecah',
      DamageType.corrosion => 'Korosi',
      DamageType.blockage => 'Penyumbatan',
      DamageType.other => 'Lainnya',
    };
  }

  String _severityLabel(DamageSeverity s) {
    return switch (s) {
      DamageSeverity.low => 'Rendah',
      DamageSeverity.medium => 'Sedang',
      DamageSeverity.high => 'Tinggi',
      DamageSeverity.critical => 'Kritis',
    };
  }

  Color _severityColor(DamageSeverity s) {
    return switch (s) {
      DamageSeverity.low => AppColors.info,
      DamageSeverity.medium => AppColors.warning,
      DamageSeverity.high => AppColors.accent,
      DamageSeverity.critical => AppColors.error,
    };
  }
}
