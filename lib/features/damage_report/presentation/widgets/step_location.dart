import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../bloc/damage_report_cubit.dart';
import '../bloc/damage_report_state.dart';

class StepLocation extends StatelessWidget {
  const StepLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Petugas',
          style: theme.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        BlocBuilder<DamageReportCubit, DamageReportState>(
          builder: (context, state) {
            final name = state is DamageReportFormUpdated ? state.reporterName : '';
            return TextFormField(
              initialValue: name,
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
              decoration: InputDecoration(
                labelText: 'Nama Petugas',
                hintText: 'Masukkan nama lengkap',
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerLowest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
              ),
              onChanged: (value) =>
                  context.read<DamageReportCubit>().setReporterName(value),
            );
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Lokasi GPS', style: theme.textTheme.labelLarge),
            Semantics(
              label: 'Update lokasi GPS',
              child: TextButton.icon(
                onPressed: () {
                  HapticHelper.selection();
                  context
                      .read<DamageReportCubit>()
                      .setLocation(-7.2575, 112.7521);
                },
                icon: const Icon(Icons.my_location, size: 16),
                label: const Text('Update'),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        BlocBuilder<DamageReportCubit, DamageReportState>(
          builder: (context, state) {
            final lat = state is DamageReportFormUpdated ? state.latitude : null;
            final lng = state is DamageReportFormUpdated ? state.longitude : null;
            final hasLocation = lat != null && lng != null;

            return Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant,
                  width: 2,
                ),
                color: theme.colorScheme.surfaceContainerLowest,
              ),
              child: Semantics(
                label: hasLocation
                    ? 'Lokasi: Surabaya, Jawa Timur. Lat: ${lat.toStringAsFixed(4)}, Lon: ${lng.toStringAsFixed(4)}'
                    : 'Lokasi belum ditentukan. Tekan Update untuk mengambil lokasi.',
                child: hasLocation
                    ? Stack(
                        children: [
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.map,
                                  size: 48,
                                  color: theme.colorScheme.primary.withAlpha(128),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Surabaya, Jawa Timur',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            top: 50,
                            left: 0,
                            right: 0,
                            child: Icon(
                              Icons.location_on,
                              color: AppColors.error,
                              size: 40,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 48,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tekan "Update" untuk mengambil lokasi',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        BlocBuilder<DamageReportCubit, DamageReportState>(
          builder: (context, state) {
            final lat = state is DamageReportFormUpdated ? state.latitude : null;
            final lng = state is DamageReportFormUpdated ? state.longitude : null;
            if (lat == null || lng == null) return const SizedBox.shrink();

            return Text(
              'Lat: ${lat.toStringAsFixed(4)}° S, Lon: ${lng.toStringAsFixed(4)}° E',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            );
          },
        ),
      ],
    );
  }
}
