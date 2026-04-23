import 'package:equatable/equatable.dart';

enum DamageType { leak, burst, corrosion, blockage, other }

enum DamageSeverity { low, medium, high, critical }

class DamageReport extends Equatable {
  final String id;
  final String taskId;
  final String reporterName;
  final DamageType damageType;
  final DamageSeverity severity;
  final double latitude;
  final double longitude;
  final String description;
  final DateTime reportedAt;
  final List<String> photoPaths;
  final bool isSynced;

  const DamageReport({
    required this.id,
    required this.taskId,
    required this.reporterName,
    required this.damageType,
    required this.severity,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.reportedAt,
    this.photoPaths = const [],
    this.isSynced = false,
  });

  DamageReport copyWith({
    String? id,
    String? taskId,
    String? reporterName,
    DamageType? damageType,
    DamageSeverity? severity,
    double? latitude,
    double? longitude,
    String? description,
    DateTime? reportedAt,
    List<String>? photoPaths,
    bool? isSynced,
  }) {
    return DamageReport(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      reporterName: reporterName ?? this.reporterName,
      damageType: damageType ?? this.damageType,
      severity: severity ?? this.severity,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
      reportedAt: reportedAt ?? this.reportedAt,
      photoPaths: photoPaths ?? this.photoPaths,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  List<Object?> get props => [id, taskId, reporterName, damageType, severity, latitude, longitude, description, reportedAt, photoPaths, isSynced];
}
