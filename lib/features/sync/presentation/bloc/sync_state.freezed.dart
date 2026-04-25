// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PendingReport> pendingReports,
            int storageBytes,
            bool isSyncing,
            String? syncError,
            DateTime? lastSyncTime)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncInitial value) initial,
    required TResult Function(SyncLoading value) loading,
    required TResult Function(SyncLoaded value) loaded,
    required TResult Function(SyncError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncInitial value)? initial,
    TResult? Function(SyncLoading value)? loading,
    TResult? Function(SyncLoaded value)? loaded,
    TResult? Function(SyncError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncInitial value)? initial,
    TResult Function(SyncLoading value)? loading,
    TResult Function(SyncLoaded value)? loaded,
    TResult Function(SyncError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStateCopyWith<$Res> {
  factory $SyncStateCopyWith(SyncState value, $Res Function(SyncState) then) =
      _$SyncStateCopyWithImpl<$Res, SyncState>;
}

/// @nodoc
class _$SyncStateCopyWithImpl<$Res, $Val extends SyncState>
    implements $SyncStateCopyWith<$Res> {
  _$SyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SyncInitialImplCopyWith<$Res> {
  factory _$$SyncInitialImplCopyWith(
          _$SyncInitialImpl value, $Res Function(_$SyncInitialImpl) then) =
      __$$SyncInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncInitialImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncInitialImpl>
    implements _$$SyncInitialImplCopyWith<$Res> {
  __$$SyncInitialImplCopyWithImpl(
      _$SyncInitialImpl _value, $Res Function(_$SyncInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SyncInitialImpl implements SyncInitial {
  const _$SyncInitialImpl();

  @override
  String toString() {
    return 'SyncState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PendingReport> pendingReports,
            int storageBytes,
            bool isSyncing,
            String? syncError,
            DateTime? lastSyncTime)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncInitial value) initial,
    required TResult Function(SyncLoading value) loading,
    required TResult Function(SyncLoaded value) loaded,
    required TResult Function(SyncError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncInitial value)? initial,
    TResult? Function(SyncLoading value)? loading,
    TResult? Function(SyncLoaded value)? loaded,
    TResult? Function(SyncError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncInitial value)? initial,
    TResult Function(SyncLoading value)? loading,
    TResult Function(SyncLoaded value)? loaded,
    TResult Function(SyncError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SyncInitial implements SyncState {
  const factory SyncInitial() = _$SyncInitialImpl;
}

/// @nodoc
abstract class _$$SyncLoadingImplCopyWith<$Res> {
  factory _$$SyncLoadingImplCopyWith(
          _$SyncLoadingImpl value, $Res Function(_$SyncLoadingImpl) then) =
      __$$SyncLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncLoadingImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncLoadingImpl>
    implements _$$SyncLoadingImplCopyWith<$Res> {
  __$$SyncLoadingImplCopyWithImpl(
      _$SyncLoadingImpl _value, $Res Function(_$SyncLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SyncLoadingImpl implements SyncLoading {
  const _$SyncLoadingImpl();

  @override
  String toString() {
    return 'SyncState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PendingReport> pendingReports,
            int storageBytes,
            bool isSyncing,
            String? syncError,
            DateTime? lastSyncTime)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncInitial value) initial,
    required TResult Function(SyncLoading value) loading,
    required TResult Function(SyncLoaded value) loaded,
    required TResult Function(SyncError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncInitial value)? initial,
    TResult? Function(SyncLoading value)? loading,
    TResult? Function(SyncLoaded value)? loaded,
    TResult? Function(SyncError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncInitial value)? initial,
    TResult Function(SyncLoading value)? loading,
    TResult Function(SyncLoaded value)? loaded,
    TResult Function(SyncError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SyncLoading implements SyncState {
  const factory SyncLoading() = _$SyncLoadingImpl;
}

/// @nodoc
abstract class _$$SyncLoadedImplCopyWith<$Res> {
  factory _$$SyncLoadedImplCopyWith(
          _$SyncLoadedImpl value, $Res Function(_$SyncLoadedImpl) then) =
      __$$SyncLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PendingReport> pendingReports,
      int storageBytes,
      bool isSyncing,
      String? syncError,
      DateTime? lastSyncTime});
}

/// @nodoc
class __$$SyncLoadedImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncLoadedImpl>
    implements _$$SyncLoadedImplCopyWith<$Res> {
  __$$SyncLoadedImplCopyWithImpl(
      _$SyncLoadedImpl _value, $Res Function(_$SyncLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingReports = null,
    Object? storageBytes = null,
    Object? isSyncing = null,
    Object? syncError = freezed,
    Object? lastSyncTime = freezed,
  }) {
    return _then(_$SyncLoadedImpl(
      pendingReports: null == pendingReports
          ? _value._pendingReports
          : pendingReports // ignore: cast_nullable_to_non_nullable
              as List<PendingReport>,
      storageBytes: null == storageBytes
          ? _value.storageBytes
          : storageBytes // ignore: cast_nullable_to_non_nullable
              as int,
      isSyncing: null == isSyncing
          ? _value.isSyncing
          : isSyncing // ignore: cast_nullable_to_non_nullable
              as bool,
      syncError: freezed == syncError
          ? _value.syncError
          : syncError // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSyncTime: freezed == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$SyncLoadedImpl implements SyncLoaded {
  const _$SyncLoadedImpl(
      {final List<PendingReport> pendingReports = const [],
      this.storageBytes = 0,
      this.isSyncing = false,
      this.syncError,
      this.lastSyncTime})
      : _pendingReports = pendingReports;

  final List<PendingReport> _pendingReports;
  @override
  @JsonKey()
  List<PendingReport> get pendingReports {
    if (_pendingReports is EqualUnmodifiableListView) return _pendingReports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingReports);
  }

  @override
  @JsonKey()
  final int storageBytes;
  @override
  @JsonKey()
  final bool isSyncing;
  @override
  final String? syncError;
  @override
  final DateTime? lastSyncTime;

  @override
  String toString() {
    return 'SyncState.loaded(pendingReports: $pendingReports, storageBytes: $storageBytes, isSyncing: $isSyncing, syncError: $syncError, lastSyncTime: $lastSyncTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._pendingReports, _pendingReports) &&
            (identical(other.storageBytes, storageBytes) ||
                other.storageBytes == storageBytes) &&
            (identical(other.isSyncing, isSyncing) ||
                other.isSyncing == isSyncing) &&
            (identical(other.syncError, syncError) ||
                other.syncError == syncError) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pendingReports),
      storageBytes,
      isSyncing,
      syncError,
      lastSyncTime);

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncLoadedImplCopyWith<_$SyncLoadedImpl> get copyWith =>
      __$$SyncLoadedImplCopyWithImpl<_$SyncLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PendingReport> pendingReports,
            int storageBytes,
            bool isSyncing,
            String? syncError,
            DateTime? lastSyncTime)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(
        pendingReports, storageBytes, isSyncing, syncError, lastSyncTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
        pendingReports, storageBytes, isSyncing, syncError, lastSyncTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          pendingReports, storageBytes, isSyncing, syncError, lastSyncTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncInitial value) initial,
    required TResult Function(SyncLoading value) loading,
    required TResult Function(SyncLoaded value) loaded,
    required TResult Function(SyncError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncInitial value)? initial,
    TResult? Function(SyncLoading value)? loading,
    TResult? Function(SyncLoaded value)? loaded,
    TResult? Function(SyncError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncInitial value)? initial,
    TResult Function(SyncLoading value)? loading,
    TResult Function(SyncLoaded value)? loaded,
    TResult Function(SyncError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SyncLoaded implements SyncState {
  const factory SyncLoaded(
      {final List<PendingReport> pendingReports,
      final int storageBytes,
      final bool isSyncing,
      final String? syncError,
      final DateTime? lastSyncTime}) = _$SyncLoadedImpl;

  List<PendingReport> get pendingReports;
  int get storageBytes;
  bool get isSyncing;
  String? get syncError;
  DateTime? get lastSyncTime;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncLoadedImplCopyWith<_$SyncLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncErrorImplCopyWith<$Res> {
  factory _$$SyncErrorImplCopyWith(
          _$SyncErrorImpl value, $Res Function(_$SyncErrorImpl) then) =
      __$$SyncErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SyncErrorImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncErrorImpl>
    implements _$$SyncErrorImplCopyWith<$Res> {
  __$$SyncErrorImplCopyWithImpl(
      _$SyncErrorImpl _value, $Res Function(_$SyncErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SyncErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SyncErrorImpl implements SyncError {
  const _$SyncErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SyncState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncErrorImplCopyWith<_$SyncErrorImpl> get copyWith =>
      __$$SyncErrorImplCopyWithImpl<_$SyncErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PendingReport> pendingReports,
            int storageBytes,
            bool isSyncing,
            String? syncError,
            DateTime? lastSyncTime)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PendingReport> pendingReports, int storageBytes,
            bool isSyncing, String? syncError, DateTime? lastSyncTime)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncInitial value) initial,
    required TResult Function(SyncLoading value) loading,
    required TResult Function(SyncLoaded value) loaded,
    required TResult Function(SyncError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncInitial value)? initial,
    TResult? Function(SyncLoading value)? loading,
    TResult? Function(SyncLoaded value)? loaded,
    TResult? Function(SyncError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncInitial value)? initial,
    TResult Function(SyncLoading value)? loading,
    TResult Function(SyncLoaded value)? loaded,
    TResult Function(SyncError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SyncError implements SyncState {
  const factory SyncError(final String message) = _$SyncErrorImpl;

  String get message;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncErrorImplCopyWith<_$SyncErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
