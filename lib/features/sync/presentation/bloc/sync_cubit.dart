import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/pending_report.dart';
import '../../domain/repositories/sync_repository.dart';
import 'sync_state.dart';

class SyncCubit extends Cubit<SyncState> {
  final SyncRepository repository;

  SyncCubit(this.repository) : super(SyncInitial());

  Future<void> loadData() async {
    emit(SyncLoading());
    try {
      final reportsResult = await repository.getPendingReports();
      final storageResult = await repository.getStorageUsageBytes();

      final reports = reportsResult.fold(
        (_) => <PendingReport>[],
        (data) => data,
      );
      final bytes = storageResult.fold(
        (_) => 0,
        (data) => data,
      );

      emit(SyncLoaded(
        pendingReports: reports,
        storageBytes: bytes,
      ));
    } catch (e) {
      emit(const SyncError('Failed to load sync data'));
    }
  }

  Future<void> syncAll() async {
    final currentState = state;
    if (currentState is! SyncLoaded || currentState.isSyncing) return;

    emit(currentState.copyWith(isSyncing: true, syncError: null));

    final result = await repository.syncAll();
    result.fold(
      (failure) {
        emit(SyncLoaded(
          pendingReports: currentState.pendingReports,
          storageBytes: currentState.storageBytes,
          isSyncing: false,
          syncError: failure.message,
        ));
      },
      (_) {
        emit(SyncLoaded(
          pendingReports: [],
          storageBytes: 0,
          isSyncing: false,
          syncError: null,
          lastSyncTime: DateTime.now(),
        ));
      },
    );
  }

  void clearSyncError() {
    final currentState = state;
    if (currentState is SyncLoaded && currentState.syncError != null) {
      emit(currentState.copyWith(syncError: null));
    }
  }
}
