import 'package:equatable/equatable.dart';

enum TaskType { meterReading, pipeInspection, repair }

enum TaskStatus { pending, inProgress, completed, escalated }

class Task extends Equatable {
  final String id;
  final String customerId;
  final String customerName;
  final String address;
  final double latitude;
  final double longitude;
  final TaskType type;
  final TaskStatus status;
  final DateTime scheduledDate;
  final String? notes;

  const Task({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.type,
    this.status = TaskStatus.pending,
    required this.scheduledDate,
    this.notes,
  });

  Task copyWith({
    String? id,
    String? customerId,
    String? customerName,
    String? address,
    double? latitude,
    double? longitude,
    TaskType? type,
    TaskStatus? status,
    DateTime? scheduledDate,
    String? notes,
  }) {
    return Task(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      type: type ?? this.type,
      status: status ?? this.status,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [id, customerId, customerName, address, latitude, longitude, type, status, scheduledDate, notes];
}
