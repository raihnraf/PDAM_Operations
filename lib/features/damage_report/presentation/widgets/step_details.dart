import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../bloc/damage_report_cubit.dart';
import '../bloc/damage_report_state.dart';

class StepDetails extends StatelessWidget {
  const StepDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Deskripsi Kerusakan', style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        BlocBuilder<DamageReportCubit, DamageReportState>(
          builder: (context, state) {
            final desc = state is DamageReportFormUpdated ? state.description : '';
            return TextFormField(
              initialValue: desc,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Deskripsi Kerusakan',
                hintText: 'Jelaskan detail kerusakan yang ditemukan...',
                alignLabelWithHint: true,
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
                  context.read<DamageReportCubit>().setDescription(value),
            );
          },
        ),
        const SizedBox(height: 24),
        Text('Foto Bukti', style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            HapticHelper.selection();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Fitur kamera akan ditambahkan'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.primary,
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(8),
              color: theme.colorScheme.primaryFixed,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_a_photo,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Capture Image',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.info,
              size: 16,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                'Pastikan kerusakan terlihat jelas. Maks 5MB per foto.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        BlocBuilder<DamageReportCubit, DamageReportState>(
          builder: (context, state) {
            final photos =
                state is DamageReportFormUpdated ? state.photoPaths : [];
            if (photos.isEmpty) return const SizedBox.shrink();

            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: photos.map((path) {
                return Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: theme.colorScheme.surfaceContainerHigh,
                      ),
                      child: Icon(
                        Icons.image,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Positioned(
                      top: -4,
                      right: -4,
                      child: GestureDetector(
                        onTap: () {
                          HapticHelper.selection();
                          context.read<DamageReportCubit>().removePhoto(path);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.error,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
