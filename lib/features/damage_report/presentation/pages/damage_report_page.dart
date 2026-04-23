import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../routing/app_routes.dart';
import '../../domain/entities/damage_report.dart';
import '../bloc/damage_report_cubit.dart';
import '../bloc/damage_report_state.dart';

class DamageReportPage extends StatelessWidget {
  final String? taskId;
  const DamageReportPage({super.key, this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = DamageReportCubit(context.read());
        if (taskId != null) {
          cubit.setTaskId(taskId!);
        }
        return cubit;
      },
      child: const _DamageReportView(),
    );
  }
}

class _DamageReportView extends StatefulWidget {
  const _DamageReportView();

  @override
  State<_DamageReportView> createState() => _DamageReportViewState();
}

class _DamageReportViewState extends State<_DamageReportView> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _reporterCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  @override
  void dispose() {
    _reporterCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.damageReportTitle)),
      body: BlocListener<DamageReportCubit, DamageReportState>(
        listener: (context, state) {
          if (state is DamageReportError) {
            HapticHelper.error();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: AppColors.error),
            );
          }
          if (state is DamageReportSaved) {
            HapticHelper.success();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Laporan Tersimpan'),
                content: const Text('Laporan berhasil disimpan dan menunggu sinkronisasi.'),
                actions: [
                  AppButton(
                    label: 'OK',
                    onPressed: () {
                      context.pop();
                      context.go(AppRoutes.taskMap);
                    },
                  ),
                ],
              ),
            );
          }
        },
        child: Stepper(
          key: ValueKey(_currentStep),
          currentStep: _currentStep,
          onStepContinue: _canContinue() ? _nextStep : null,
          onStepCancel: _currentStep > 0 ? _prevStep : null,
          controlsBuilder: _controlsBuilder,
          steps: [
            _stepLocation(),
            _stepDamage(),
            _stepDetails(),
            _stepReview(),
          ],
        ),
      ),
    );
  }

  bool _canContinue() {
    return switch (_currentStep) {
      0 => _reporterCtrl.text.trim().isNotEmpty,
      1 => true,
      2 => _descCtrl.text.trim().length >= 20,
      3 => true,
      _ => false,
    };
  }

  void _nextStep() {
    if (_currentStep < 3) {
      HapticHelper.selection();
      setState(() => _currentStep++);
    } else {
      _submit();
    }
  }

  void _prevStep() {
    HapticHelper.selection();
    setState(() => _currentStep--);
  }

  void _submit() {
    HapticHelper.confirm();
    context.read<DamageReportCubit>().submitReport();
  }

  Widget _controlsBuilder(BuildContext context, ControlsDetails details) {
    return BlocBuilder<DamageReportCubit, DamageReportState>(
      builder: (_, state) {
        final isLoading = state is DamageReportSaving;
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  label: _currentStep == 3 ? AppStrings.submit : 'Lanjut',
                  onPressed: _canContinue() ? details.onStepContinue : null,
                  isLoading: isLoading,
                  icon: _currentStep == 3 ? Icons.send : Icons.arrow_forward,
                ),
              ),
              if (_currentStep > 0) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
                    label: 'Kembali',
                    onPressed: isLoading ? null : details.onStepCancel,
                    isOutlined: true,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Step _stepLocation() {
    return Step(
      title: const Text(AppStrings.stepLocation),
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _reporterCtrl,
              decoration: const InputDecoration(
                labelText: 'Nama Petugas',
                hintText: 'Masukkan nama lengkap',
              ),
              onChanged: (_) => setState(() {}),
              validator: (v) => v == null || v.trim().isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.primary),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lokasi akan diambil otomatis'),
                          Text('dari GPS perangkat', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      isActive: _currentStep >= 0,
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
    );
  }

  Step _stepDamage() {
    final cubit = context.read<DamageReportCubit>();
    return Step(
      title: const Text(AppStrings.stepDamage),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jenis Kerusakan', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: DamageType.values.map((type) {
              return ChoiceChip(
                label: Text(_damageTypeLabel(type)),
                selected: false,
                onSelected: (_) {
                  HapticHelper.selection();
                  cubit.setDamageType(type);
                  setState(() {});
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text('Tingkat Keparahan', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          SegmentedButton<DamageSeverity>(
            segments: DamageSeverity.values.map((s) {
              return ButtonSegment(
                value: s,
                label: Text(_severityLabel(s)),
                icon: Icon(_severityIcon(s)),
              );
            }).toList(),
            selected: {DamageSeverity.medium},
            onSelectionChanged: (set) {
              HapticHelper.selection();
              cubit.setSeverity(set.first);
            },
          ),
        ],
      ),
      isActive: _currentStep >= 1,
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
    );
  }

  Step _stepDetails() {
    return Step(
      title: const Text(AppStrings.stepDetails),
      content: Column(
        children: [
          TextFormField(
            controller: _descCtrl,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Deskripsi Kerusakan',
              hintText: 'Jelaskan detail kerusakan yang ditemukan...',
              alignLabelWithHint: true,
            ),
            onChanged: (_) => setState(() {}),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Wajib diisi';
              if (v.trim().length < 20) return 'Minimal 20 karakter';
              return null;
            },
          ),
          const SizedBox(height: 16),
          const Card(
            child: ListTile(
              leading: Icon(Icons.camera_alt, color: AppColors.primary),
              title: Text('Tambah Foto'),
              subtitle: Text('Fitur kamera akan ditambahkan'),
              enabled: false,
            ),
          ),
        ],
      ),
      isActive: _currentStep >= 2,
      state: _currentStep > 2 ? StepState.complete : StepState.indexed,
    );
  }

  Step _stepReview() {
    final cubit = context.read<DamageReportCubit>();
    return Step(
      title: const Text(AppStrings.stepReview),
      content: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _reviewRow('Petugas', _reporterCtrl.text),
              _reviewRow('Jenis', _damageTypeLabel(cubit.damageType)),
              _reviewRow('Keparahan', _severityLabel(cubit.severity)),
              _reviewRow('Deskripsi', _descCtrl.text),
            ],
          ),
        ),
      ),
      isActive: _currentStep >= 3,
    );
  }

  Widget _reviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(color: AppColors.textSecondary))),
          Expanded(child: Text(value)),
        ],
      ),
    );
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

  IconData _severityIcon(DamageSeverity s) {
    return switch (s) {
      DamageSeverity.low => Icons.info_outline,
      DamageSeverity.medium => Icons.warning_amber,
      DamageSeverity.high => Icons.warning,
      DamageSeverity.critical => Icons.error,
    };
  }
}
