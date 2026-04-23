import 'package:equatable/equatable.dart';
import '../../domain/entities/damage_report.dart';

sealed class DamageReportState extends Equatable {
  const DamageReportState();

  @override
  List<Object?> get props => [];
}

class DamageReportInitial extends DamageReportState {}

class DamageReportSaving extends DamageReportState {}

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
