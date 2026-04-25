// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListInitial value) initial,
    required TResult Function(TaskListLoading value) loading,
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListInitial value)? initial,
    TResult? Function(TaskListLoading value)? loading,
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListInitial value)? initial,
    TResult Function(TaskListLoading value)? loading,
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListStateCopyWith<$Res> {
  factory $TaskListStateCopyWith(
          TaskListState value, $Res Function(TaskListState) then) =
      _$TaskListStateCopyWithImpl<$Res, TaskListState>;
}

/// @nodoc
class _$TaskListStateCopyWithImpl<$Res, $Val extends TaskListState>
    implements $TaskListStateCopyWith<$Res> {
  _$TaskListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskListInitialImplCopyWith<$Res> {
  factory _$$TaskListInitialImplCopyWith(_$TaskListInitialImpl value,
          $Res Function(_$TaskListInitialImpl) then) =
      __$$TaskListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskListInitialImplCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res, _$TaskListInitialImpl>
    implements _$$TaskListInitialImplCopyWith<$Res> {
  __$$TaskListInitialImplCopyWithImpl(
      _$TaskListInitialImpl _value, $Res Function(_$TaskListInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskListInitialImpl implements TaskListInitial {
  const _$TaskListInitialImpl();

  @override
  String toString() {
    return 'TaskListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)
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
    TResult? Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
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
    TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
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
    required TResult Function(TaskListInitial value) initial,
    required TResult Function(TaskListLoading value) loading,
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListInitial value)? initial,
    TResult? Function(TaskListLoading value)? loading,
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListInitial value)? initial,
    TResult Function(TaskListLoading value)? loading,
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TaskListInitial implements TaskListState {
  const factory TaskListInitial() = _$TaskListInitialImpl;
}

/// @nodoc
abstract class _$$TaskListLoadingImplCopyWith<$Res> {
  factory _$$TaskListLoadingImplCopyWith(_$TaskListLoadingImpl value,
          $Res Function(_$TaskListLoadingImpl) then) =
      __$$TaskListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskListLoadingImplCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res, _$TaskListLoadingImpl>
    implements _$$TaskListLoadingImplCopyWith<$Res> {
  __$$TaskListLoadingImplCopyWithImpl(
      _$TaskListLoadingImpl _value, $Res Function(_$TaskListLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskListLoadingImpl implements TaskListLoading {
  const _$TaskListLoadingImpl();

  @override
  String toString() {
    return 'TaskListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)
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
    TResult? Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
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
    TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
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
    required TResult Function(TaskListInitial value) initial,
    required TResult Function(TaskListLoading value) loading,
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListInitial value)? initial,
    TResult? Function(TaskListLoading value)? loading,
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListInitial value)? initial,
    TResult Function(TaskListLoading value)? loading,
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TaskListLoading implements TaskListState {
  const factory TaskListLoading() = _$TaskListLoadingImpl;
}

/// @nodoc
abstract class _$$TaskListLoadedImplCopyWith<$Res> {
  factory _$$TaskListLoadedImplCopyWith(_$TaskListLoadedImpl value,
          $Res Function(_$TaskListLoadedImpl) then) =
      __$$TaskListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Task> tasks, TaskFilter activeFilter, String? actingTaskId});
}

/// @nodoc
class __$$TaskListLoadedImplCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res, _$TaskListLoadedImpl>
    implements _$$TaskListLoadedImplCopyWith<$Res> {
  __$$TaskListLoadedImplCopyWithImpl(
      _$TaskListLoadedImpl _value, $Res Function(_$TaskListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? activeFilter = null,
    Object? actingTaskId = freezed,
  }) {
    return _then(_$TaskListLoadedImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      activeFilter: null == activeFilter
          ? _value.activeFilter
          : activeFilter // ignore: cast_nullable_to_non_nullable
              as TaskFilter,
      actingTaskId: freezed == actingTaskId
          ? _value.actingTaskId
          : actingTaskId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TaskListLoadedImpl implements TaskListLoaded {
  const _$TaskListLoadedImpl(
      {required final List<Task> tasks,
      this.activeFilter = TaskFilter.pending,
      this.actingTaskId})
      : _tasks = tasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey()
  final TaskFilter activeFilter;
  @override
  final String? actingTaskId;

  @override
  String toString() {
    return 'TaskListState.loaded(tasks: $tasks, activeFilter: $activeFilter, actingTaskId: $actingTaskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListLoadedImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.activeFilter, activeFilter) ||
                other.activeFilter == activeFilter) &&
            (identical(other.actingTaskId, actingTaskId) ||
                other.actingTaskId == actingTaskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tasks), activeFilter, actingTaskId);

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskListLoadedImplCopyWith<_$TaskListLoadedImpl> get copyWith =>
      __$$TaskListLoadedImplCopyWithImpl<_$TaskListLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(tasks, activeFilter, actingTaskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(tasks, activeFilter, actingTaskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tasks, activeFilter, actingTaskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListInitial value) initial,
    required TResult Function(TaskListLoading value) loading,
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListInitial value)? initial,
    TResult? Function(TaskListLoading value)? loading,
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListInitial value)? initial,
    TResult Function(TaskListLoading value)? loading,
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TaskListLoaded implements TaskListState {
  const factory TaskListLoaded(
      {required final List<Task> tasks,
      final TaskFilter activeFilter,
      final String? actingTaskId}) = _$TaskListLoadedImpl;

  List<Task> get tasks;
  TaskFilter get activeFilter;
  String? get actingTaskId;

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskListLoadedImplCopyWith<_$TaskListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskListErrorImplCopyWith<$Res> {
  factory _$$TaskListErrorImplCopyWith(
          _$TaskListErrorImpl value, $Res Function(_$TaskListErrorImpl) then) =
      __$$TaskListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TaskListErrorImplCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res, _$TaskListErrorImpl>
    implements _$$TaskListErrorImplCopyWith<$Res> {
  __$$TaskListErrorImplCopyWithImpl(
      _$TaskListErrorImpl _value, $Res Function(_$TaskListErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TaskListErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskListErrorImpl implements TaskListError {
  const _$TaskListErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TaskListState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskListErrorImplCopyWith<_$TaskListErrorImpl> get copyWith =>
      __$$TaskListErrorImplCopyWithImpl<_$TaskListErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)
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
    TResult? Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
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
    TResult Function(
            List<Task> tasks, TaskFilter activeFilter, String? actingTaskId)?
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
    required TResult Function(TaskListInitial value) initial,
    required TResult Function(TaskListLoading value) loading,
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListInitial value)? initial,
    TResult? Function(TaskListLoading value)? loading,
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListInitial value)? initial,
    TResult Function(TaskListLoading value)? loading,
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TaskListError implements TaskListState {
  const factory TaskListError(final String message) = _$TaskListErrorImpl;

  String get message;

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskListErrorImplCopyWith<_$TaskListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
