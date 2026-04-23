import 'package:equatable/equatable.dart';

class OfficerProfile extends Equatable {
  final String id;
  final String name;
  final String role;
  final String unit;
  final int tasksCompleted;
  final int tasksThisWeek;
  final int hoursInField;
  final int efficiencyScore;
  final bool isOnDuty;

  const OfficerProfile({
    required this.id,
    required this.name,
    required this.role,
    required this.unit,
    this.tasksCompleted = 0,
    this.tasksThisWeek = 0,
    this.hoursInField = 0,
    this.efficiencyScore = 0,
    this.isOnDuty = false,
  });

  @override
  List<Object?> get props => [id, name, role, unit, tasksCompleted, tasksThisWeek, hoursInField, efficiencyScore, isOnDuty];
}
