import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pdam_fields/core/errors/failures.dart';
import 'package:pdam_fields/core/utils/result.dart';
import 'package:pdam_fields/features/task_list/presentation/bloc/task_list_cubit.dart';
import 'package:pdam_fields/features/task_list/presentation/bloc/task_list_state.dart';
import 'package:pdam_fields/features/task_map/domain/entities/task.dart';
import 'package:pdam_fields/features/task_map/domain/repositories/task_repository.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late TaskListCubit cubit;
  late MockTaskRepository mockRepository;

  final testTasks = <Task>[
    Task(
      id: 'task-1',
      customerId: 'CUST-001',
      customerName: 'Budi Santoso',
      address: 'Jl. Sudirman No. 1',
      latitude: -7.257472,
      longitude: 112.752090,
      type: TaskType.repair,
      status: TaskStatus.pending,
      scheduledDate: DateTime.now().add(const Duration(days: 1)),
    ),
    Task(
      id: 'task-2',
      customerId: 'CUST-002',
      customerName: 'Siti Rahayu',
      address: 'Jl. Thamrin No. 5',
      latitude: -7.260000,
      longitude: 112.755000,
      type: TaskType.meterReading,
      status: TaskStatus.inProgress,
      scheduledDate: DateTime.now().add(const Duration(days: 2)),
    ),
    Task(
      id: 'task-3',
      customerId: 'CUST-003',
      customerName: 'Ahmad Wijaya',
      address: 'Jl. Gatot Subroto No. 10',
      latitude: -7.263000,
      longitude: 112.758000,
      type: TaskType.pipeInspection,
      status: TaskStatus.completed,
      scheduledDate: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  setUp(() {
    mockRepository = MockTaskRepository();
    cubit = TaskListCubit(mockRepository);
  });

  tearDown(() => cubit.close());

  group('constructor', () {
    test('should emit TaskListInitial when created', () {
      expect(cubit.state, isA<TaskListInitial>());
    });
  });

  group('loadTasks', () {
    blocTest<TaskListCubit, TaskListState>(
      'emits TaskListLoading then TaskListLoaded when successful',
      setUp: () {
        when(() => mockRepository.getTasks())
            .thenAnswer((_) async => Success(testTasks));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadTasks(),
      expect: () => [
        isA<TaskListLoading>(),
        isA<TaskListLoaded>()
            .having((s) => s.tasks, 'tasks', testTasks)
            .having((s) => s.activeFilter, 'activeFilter', TaskFilter.pending),
      ],
      verify: (_) {
        verify(() => mockRepository.getTasks()).called(1);
      },
    );

    blocTest<TaskListCubit, TaskListState>(
      'emits TaskListLoading then TaskListError when failed',
      setUp: () {
        when(() => mockRepository.getTasks()).thenAnswer(
            (_) async => const FailureResult(ServerFailure('Network error')));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadTasks(),
      expect: () => [
        isA<TaskListLoading>(),
        isA<TaskListError>().having(
          (s) => s.message,
          'message',
          'Gagal memuat tugas',
        ),
      ],
    );

    blocTest<TaskListCubit, TaskListState>(
      'preserves current filter when reloading',
      setUp: () {
        when(() => mockRepository.getTasks())
            .thenAnswer((_) async => Success(testTasks));
      },
      build: () => cubit,
      seed: () => TaskListLoaded(
        tasks: testTasks,
        activeFilter: TaskFilter.completed,
      ),
      act: (cubit) => cubit.loadTasks(),
      expect: () => [
        isA<TaskListLoading>(),
        isA<TaskListLoaded>().having(
          (s) => s.activeFilter,
          'activeFilter',
          TaskFilter.pending,
        ),
      ],
    );
  });

  group('setFilter', () {
    blocTest<TaskListCubit, TaskListState>(
      'emits updated TaskListLoaded with new filter',
      build: () => cubit,
      seed: () => TaskListLoaded(
        tasks: testTasks,
        activeFilter: TaskFilter.pending,
      ),
      act: (cubit) => cubit.setFilter(TaskFilter.completed),
      expect: () => [
        isA<TaskListLoaded>()
            .having((s) => s.activeFilter, 'activeFilter', TaskFilter.completed)
            .having((s) => s.actingTaskId, 'actingTaskId', isNull),
      ],
    );

    test('does nothing when state is not TaskListLoaded', () {
      cubit.setFilter(TaskFilter.completed);
      expect(cubit.state, isA<TaskListInitial>());
    });
  });

  group('getFilteredTasks', () {
    test('returns empty list when state is not TaskListLoaded', () {
      expect(cubit.getFilteredTasks(), isEmpty);
    });

    test('returns pending tasks when filter is pending', () {
      cubit.emit(TaskListLoaded(
        tasks: testTasks,
        activeFilter: TaskFilter.pending,
      ));
      final filtered = cubit.getFilteredTasks();
      expect(filtered.length, 2);
      expect(filtered.any((t) => t.id == 'task-1'), isTrue);
      expect(filtered.any((t) => t.id == 'task-2'), isTrue);
    });

    test('returns completed tasks when filter is completed', () {
      cubit.emit(TaskListLoaded(
        tasks: testTasks,
        activeFilter: TaskFilter.completed,
      ));
      final filtered = cubit.getFilteredTasks();
      expect(filtered.length, 1);
      expect(filtered.first.id, 'task-3');
    });
  });

  group('completeTask', () {
    blocTest<TaskListCubit, TaskListState>(
      'completes task successfully and reloads tasks',
      setUp: () {
        when(() => mockRepository.updateTaskStatus('task-1', TaskStatus.completed))
            .thenAnswer((_) async => Success(testTasks.first));
        when(() => mockRepository.getTasks())
            .thenAnswer((_) async => Success(testTasks));
      },
      build: () => cubit,
      seed: () => TaskListLoaded(
        tasks: testTasks,
        activeFilter: TaskFilter.pending,
      ),
      act: (cubit) => cubit.completeTask('task-1'),
      expect: () => [
        isA<TaskListLoaded>().having(
          (s) => s.actingTaskId,
          'actingTaskId',
          'task-1',
        ),
        isA<TaskListLoading>(),
        isA<TaskListLoaded>(),
      ],
      verify: (_) {
        verify(() => mockRepository.updateTaskStatus('task-1', TaskStatus.completed)).called(1);
        verify(() => mockRepository.getTasks()).called(1);
      },
    );

    blocTest<TaskListCubit, TaskListState>(
      'emits error when completing task fails',
      setUp: () {
        when(() => mockRepository.updateTaskStatus('task-1', TaskStatus.completed))
            .thenAnswer((_) async => const FailureResult(ServerFailure('Network error')));
      },
      build: () => cubit,
      seed: () => TaskListLoaded(
        tasks: testTasks,
        activeFilter: TaskFilter.pending,
      ),
      act: (cubit) => cubit.completeTask('task-1'),
      expect: () => [
        isA<TaskListLoaded>().having(
          (s) => s.actingTaskId,
          'actingTaskId',
          'task-1',
        ),
        isA<TaskListLoaded>().having(
          (s) => s.actingTaskId,
          'actingTaskId',
          isNull,
        ),
        isA<TaskListError>().having(
          (s) => s.message,
          'message',
          'Gagal menyelesaikan tugas',
        ),
      ],
    );
  });

  group('escalateTask', () {
    blocTest<TaskListCubit, TaskListState>(
      'escalates task successfully and reloads tasks',
      setUp: () {
        when(() => mockRepository.updateTaskStatus('task-1', TaskStatus.escalated))
            .thenAnswer((_) async => Success(testTasks.first));
        when(() => mockRepository.getTasks())
            .thenAnswer((_) async => Success(testTasks));
      },
      build: () => cubit,
      seed: () => TaskListLoaded(
        tasks: testTasks,
        activeFilter: TaskFilter.pending,
      ),
      act: (cubit) => cubit.escalateTask('task-1'),
      expect: () => [
        isA<TaskListLoaded>().having(
          (s) => s.actingTaskId,
          'actingTaskId',
          'task-1',
        ),
        isA<TaskListLoading>(),
        isA<TaskListLoaded>(),
      ],
    );

    blocTest<TaskListCubit, TaskListState>(
      'emits error when escalating task fails',
      setUp: () {
        when(() => mockRepository.updateTaskStatus('task-1', TaskStatus.escalated))
            .thenAnswer((_) async => const FailureResult(ServerFailure('Network error')));
      },
      build: () => cubit,
      seed: () => TaskListLoaded(
        tasks: testTasks,
        activeFilter: TaskFilter.pending,
      ),
      act: (cubit) => cubit.escalateTask('task-1'),
      expect: () => [
        isA<TaskListLoaded>().having(
          (s) => s.actingTaskId,
          'actingTaskId',
          'task-1',
        ),
        isA<TaskListLoaded>().having(
          (s) => s.actingTaskId,
          'actingTaskId',
          isNull,
        ),
        isA<TaskListError>().having(
          (s) => s.message,
          'message',
          'Gagal melakukan eskalasi',
        ),
      ],
    );
  });
}
