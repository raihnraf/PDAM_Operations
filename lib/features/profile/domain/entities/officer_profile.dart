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

  OfficerProfile copyWith({
    String? id,
    String? name,
    String? role,
    String? unit,
    int? tasksCompleted,
    int? tasksThisWeek,
    int? hoursInField,
    int? efficiencyScore,
    bool? isOnDuty,
  }) {
    return OfficerProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      unit: unit ?? this.unit,
      tasksCompleted: tasksCompleted ?? this.tasksCompleted,
      tasksThisWeek: tasksThisWeek ?? this.tasksThisWeek,
      hoursInField: hoursInField ?? this.hoursInField,
      efficiencyScore: efficiencyScore ?? this.efficiencyScore,
      isOnDuty: isOnDuty ?? this.isOnDuty,
    );
  }
}
