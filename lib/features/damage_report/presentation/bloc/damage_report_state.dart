import 'package:equatable/equatable.dart';
import '../../domain/entities/damage_report.dart';

sealed class DamageReportState extends Equatable {
  const DamageReportState();

  @override
  List<Object?> get props => [];
}

class DamageReportInitial extends DamageReportState {}

class DamageReportLoading extends DamageReportState {}

class DamageReportFormUpdated extends DamageReportState {
  final DamageType damageType;
  final DamageSeverity severity;
  final String description;
  final double latitude;
  final double longitude;
  final String reporterName;
  final String taskId;
  final List<String> photoPaths;

  const DamageReportFormUpdated({
    required this.damageType,
    required this.severity,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.reporterName,
    required this.taskId,
    required this.photoPaths,
  });

  @override
  List<Object?> get props => [
        damageType,
        severity,
        description,
        latitude,
        longitude,
        reporterName,
        taskId,
        photoPaths,
      ];
}

class DamageReportSaved extends DamageReportState {
  final DamageReport report;
  const DamageReportSaved(this.report);

  @override
  List<Object?> get props => [report];
}

class DamageReportError extends DamageReportState {
  final String message;
  const DamageReportError(this.message);

  @override
  List<Object?> get props => [message];
}
