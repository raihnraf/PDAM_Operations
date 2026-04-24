import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/haptic_helper.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../injection_container.dart';
import '../bloc/damage_report_cubit.dart';
import '../bloc/damage_report_state.dart';
import '../widgets/widgets.dart';

class DamageReportPage extends StatelessWidget {
  final String? taskId;
  const DamageReportPage({super.key, this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = sl<DamageReportCubit>();
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
  final _reporterCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  static const _stepLabels = ['Lokasi', 'Jenis', 'Detail', 'Review'];

  @override
  void dispose() {
    _reporterCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.damageReportTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocListener<DamageReportCubit, DamageReportState>(
                listener: (context, state) {
                  if (state is DamageReportError) {
                    HapticHelper.error();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.error,
                      ),
                    );
                  }
                  if (state is DamageReportSaved) {
                    HapticHelper.success();
                    showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      builder: (_) => const SuccessBottomSheet(),
                    );
                  }
                },
                child: BlocBuilder<DamageReportCubit, DamageReportState>(
                  builder: (context, state) {
                    final isLoading = state is DamageReportLoading;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: StepperIndicator(
                            currentStep: _currentStep,
                            totalSteps: 4,
                            stepLabels: _stepLabels,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: _buildStepContent(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Column(
                            children: [
                              _buildActionButtons(isLoading),
                              const SizedBox(height: 12),
                              const OfflineBanner(),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    return switch (_currentStep) {
      0 => StepLocation(
          reporterCtrl: _reporterCtrl,
          onChanged: (_) => setState(() {}),
        ),
      1 => const StepDamage(),
      2 => StepDetails(
          descCtrl: _descCtrl,
          onChanged: (_) => setState(() {}),
        ),
      3 => StepReview(reporterName: _reporterCtrl.text),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildActionButtons(bool isLoading) {
    final canContinue = _canContinue();
    final isLastStep = _currentStep == 3;

    return Row(
      children: [
        Expanded(
          child: AppButton(
            label: isLastStep ? AppStrings.submit : 'Lanjut',
            onPressed: canContinue && !isLoading ? _nextStep : null,
            isLoading: isLoading,
            icon: isLastStep ? Icons.send : Icons.arrow_forward,
          ),
        ),
        if (_currentStep > 0) ...[
          const SizedBox(width: 12),
          Expanded(
            child: AppButton(
              label: 'Kembali',
              onPressed: isLoading ? null : _prevStep,
              isOutlined: true,
            ),
          ),
        ],
      ],
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
}
