import '../../domain/entities/task.dart';

class MockTasks {
  MockTasks._();

  static List<Task> get all => [
    Task(
      id: 'TSK-001',
      customerId: 'PLG-1023',
      customerName: 'Budi Santoso',
      address: 'Jl. Raya Darmo No. 45, Surabaya',
      latitude: -7.2575,
      longitude: 112.7521,
      type: TaskType.meterReading,
      status: TaskStatus.pending,
      scheduledDate: DateTime(2026, 4, 24),
    ),
    Task(
      id: 'TSK-002',
      customerId: 'PLG-2047',
      customerName: 'Siti Rahayu',
      address: 'Jl. Gubeng Kertajaya No. 12, Surabaya',
      latitude: -7.2654,
      longitude: 112.7543,
      type: TaskType.pipeInspection,
      status: TaskStatus.pending,
      scheduledDate: DateTime(2026, 4, 24),
    ),
    Task(
      id: 'TSK-003',
      customerId: 'PLG-3089',
      customerName: 'Ahmad Fauzi',
      address: 'Jl. Manyar Kertoarjo No. 78, Surabaya',
      latitude: -7.2712,
      longitude: 112.7612,
      type: TaskType.repair,
      status: TaskStatus.inProgress,
      scheduledDate: DateTime(2026, 4, 24),
      notes: 'Pipa bocor diameter 2 inch, tekanan air rendah',
    ),
    Task(
      id: 'TSK-004',
      customerId: 'PLG-4102',
      customerName: 'Dewi Lestari',
      address: 'Jl. Rungkut Industri No. 3, Surabaya',
      latitude: -7.3123,
      longitude: 112.7689,
      type: TaskType.meterReading,
      status: TaskStatus.pending,
      scheduledDate: DateTime(2026, 4, 24),
    ),
    Task(
      id: 'TSK-005',
      customerId: 'PLG-5234',
      customerName: 'Hendra Wijaya',
      address: 'Jl. Ahmad Yani No. 156, Surabaya',
      latitude: -7.2890,
      longitude: 112.7345,
      type: TaskType.repair,
      status: TaskStatus.escalated,
      scheduledDate: DateTime(2026, 4, 23),
      notes: 'Kerusakan pipa utama, memerlukan tim tambahan',
    ),
  ];
}
