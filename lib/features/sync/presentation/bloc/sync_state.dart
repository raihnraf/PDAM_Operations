import 'package:equatable/equatable.dart';
import '../../domain/entities/pending_report.dart';

sealed class SyncState extends Equatable {
  const SyncState();

  @override
  List<Object?> get props => [];
}

class SyncInitial extends SyncState {}

class SyncLoading extends SyncState {}

class SyncLoaded extends SyncState {
  final List<PendingReport> pendingReports;
  final int storageBytes;
  final bool isSyncing;
  final String? syncError;
  final DateTime? lastSyncTime;

  const SyncLoaded({
    this.pendingReports = const [],
    this.storageBytes = 0,
    this.isSyncing = false,
    this.syncError,
    this.lastSyncTime,
  });

  @override
  List<Object?> get props => [pendingReports, storageBytes, isSyncing, syncError, lastSyncTime];

  SyncLoaded copyWith({
    List<PendingReport>? pendingReports,
    int? storageBytes,
    bool? isSyncing,
    String? syncError,
    DateTime? lastSyncTime,
  }) {
    return SyncLoaded(
      pendingReports: pendingReports ?? this.pendingReports,
      storageBytes: storageBytes ?? this.storageBytes,
      isSyncing: isSyncing ?? this.isSyncing,
      syncError: syncError ?? this.syncError,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
    );
  }
}

class SyncError extends SyncState {
  final String message;

  const SyncError(this.message);

  @override
  List<Object?> get props => [message];
}
