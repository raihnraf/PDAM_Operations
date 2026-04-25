import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/pending_report.dart';

part 'sync_state.freezed.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState.initial() = SyncInitial;
  const factory SyncState.loading() = SyncLoading;
  const factory SyncState.loaded({
    @Default([]) List<PendingReport> pendingReports,
    @Default(0) int storageBytes,
    @Default(false) bool isSyncing,
    String? syncError,
    DateTime? lastSyncTime,
  }) = SyncLoaded;
  const factory SyncState.error(String message) = SyncError;
}
