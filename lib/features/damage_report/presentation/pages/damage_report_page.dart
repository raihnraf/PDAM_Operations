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

class _DamageReportView extends StatelessWidget {
  const _DamageReportView();

  static const _stepLabels = [
    AppStrings.stepLocation,
    AppStrings.stepDamage,
    AppStrings.stepDetails,
    AppStrings.stepReview,
  ];

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
                    tooltip: 'Kembali',
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
              child: BlocConsumer<DamageReportCubit, DamageReportState>(
                listener: (context, state) {
                  if (state is DamageReportError) {
                    HapticHelper.error();
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.error,
                      ),
                    );
                  }
                  if (state is DamageReportSaved) {
                    HapticHelper.success();
                    if (!context.mounted) return;
                    showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      builder: (_) => const SuccessBottomSheet(),
                    );
                  }
                },
                builder: (context, state) {
                  final isLoading = state is DamageReportLoading;
                  final currentStep =
                      state is DamageReportFormUpdated ? state.currentStep : 0;
                  return Column(
                    children: [
                      Padding(
                        padding: AppSpacing.allMd,
                        child: Semantics(
                          label:
                              'Langkah ${currentStep + 1} dari 4: ${_stepLabels[currentStep]}',
                          child: StepperIndicator(
                            currentStep: currentStep,
                            totalSteps: 4,
                            stepLabels: _stepLabels,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: AppSpacing.horizontalMd,
                          child: _buildStepContent(currentStep),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Column(
                          children: [
                            _buildActionButtons(context, currentStep, isLoading),
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
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(int currentStep) {
    return switch (currentStep) {
      0 => const StepLocation(),
      1 => const StepDamage(),
      2 => const StepDetails(),
      3 => const StepReview(),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildActionButtons(BuildContext context, int currentStep, bool isLoading) {
    final isLastStep = currentStep == 3;

    return Row(
      children: [
        Expanded(
          child: AppButton(
            label: isLastStep ? AppStrings.submit : 'Lanjut',
            onPressed: isLoading ? null : () => _nextStep(context, currentStep),
            isLoading: isLoading,
            icon: isLastStep ? Icons.send : Icons.arrow_forward,
          ),
        ),
        if (currentStep > 0) ...[
          const SizedBox(width: 12),
          Expanded(
            child: AppButton(
              label: 'Kembali',
              onPressed: isLoading ? null : () => _prevStep(context),
              isOutlined: true,
            ),
          ),
        ],
      ],
    );
  }

  void _nextStep(BuildContext context, int currentStep) {
    if (currentStep < 3) {
      HapticHelper.selection();
      context.read<DamageReportCubit>().goToNextStep();
    } else {
      _submit(context);
    }
  }

  void _prevStep(BuildContext context) {
    HapticHelper.selection();
    context.read<DamageReportCubit>().goToPrevStep();
  }

  void _submit(BuildContext context) {
    HapticHelper.confirm();
    context.read<DamageReportCubit>().submitReport();
  }
}
