// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskMapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks, String? selectedTaskId) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks, String? selectedTaskId)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks, String? selectedTaskId)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskMapInitial value) initial,
    required TResult Function(TaskMapLoading value) loading,
    required TResult Function(TaskMapLoaded value) loaded,
    required TResult Function(TaskMapError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskMapInitial value)? initial,
    TResult? Function(TaskMapLoading value)? loading,
    TResult? Function(TaskMapLoaded value)? loaded,
    TResult? Function(TaskMapError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskMapInitial value)? initial,
    TResult Function(TaskMapLoading value)? loading,
    TResult Function(TaskMapLoaded value)? loaded,
    TResult Function(TaskMapError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskMapStateCopyWith<$Res> {
  factory $TaskMapStateCopyWith(
          TaskMapState value, $Res Function(TaskMapState) then) =
      _$TaskMapStateCopyWithImpl<$Res, TaskMapState>;
}

/// @nodoc
class _$TaskMapStateCopyWithImpl<$Res, $Val extends TaskMapState>
    implements $TaskMapStateCopyWith<$Res> {
  _$TaskMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskMapInitialImplCopyWith<$Res> {
  factory _$$TaskMapInitialImplCopyWith(_$TaskMapInitialImpl value,
          $Res Function(_$TaskMapInitialImpl) then) =
      __$$TaskMapInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskMapInitialImplCopyWithImpl<$Res>
    extends _$TaskMapStateCopyWithImpl<$Res, _$TaskMapInitialImpl>
    implements _$$TaskMapInitialImplCopyWith<$Res> {
  __$$TaskMapInitialImplCopyWithImpl(
      _$TaskMapInitialImpl _value, $Res Function(_$TaskMapInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskMapInitialImpl implements TaskMapInitial {
  const _$TaskMapInitialImpl();

  @override
  String toString() {
    return 'TaskMapState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskMapInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks, String? selectedTaskId) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks, String? selectedTaskId)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks, String? selectedTaskId)? loaded,
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
    required TResult Function(TaskMapInitial value) initial,
    required TResult Function(TaskMapLoading value) loading,
    required TResult Function(TaskMapLoaded value) loaded,
    required TResult Function(TaskMapError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskMapInitial value)? initial,
    TResult? Function(TaskMapLoading value)? loading,
    TResult? Function(TaskMapLoaded value)? loaded,
    TResult? Function(TaskMapError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskMapInitial value)? initial,
    TResult Function(TaskMapLoading value)? loading,
    TResult Function(TaskMapLoaded value)? loaded,
    TResult Function(TaskMapError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TaskMapInitial implements TaskMapState {
  const factory TaskMapInitial() = _$TaskMapInitialImpl;
}

/// @nodoc
abstract class _$$TaskMapLoadingImplCopyWith<$Res> {
  factory _$$TaskMapLoadingImplCopyWith(_$TaskMapLoadingImpl value,
          $Res Function(_$TaskMapLoadingImpl) then) =
      __$$TaskMapLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskMapLoadingImplCopyWithImpl<$Res>
    extends _$TaskMapStateCopyWithImpl<$Res, _$TaskMapLoadingImpl>
    implements _$$TaskMapLoadingImplCopyWith<$Res> {
  __$$TaskMapLoadingImplCopyWithImpl(
      _$TaskMapLoadingImpl _value, $Res Function(_$TaskMapLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskMapLoadingImpl implements TaskMapLoading {
  const _$TaskMapLoadingImpl();

  @override
  String toString() {
    return 'TaskMapState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskMapLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks, String? selectedTaskId) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks, String? selectedTaskId)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks, String? selectedTaskId)? loaded,
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
    required TResult Function(TaskMapInitial value) initial,
    required TResult Function(TaskMapLoading value) loading,
    required TResult Function(TaskMapLoaded value) loaded,
    required TResult Function(TaskMapError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskMapInitial value)? initial,
    TResult? Function(TaskMapLoading value)? loading,
    TResult? Function(TaskMapLoaded value)? loaded,
    TResult? Function(TaskMapError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskMapInitial value)? initial,
    TResult Function(TaskMapLoading value)? loading,
    TResult Function(TaskMapLoaded value)? loaded,
    TResult Function(TaskMapError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TaskMapLoading implements TaskMapState {
  const factory TaskMapLoading() = _$TaskMapLoadingImpl;
}

/// @nodoc
abstract class _$$TaskMapLoadedImplCopyWith<$Res> {
  factory _$$TaskMapLoadedImplCopyWith(
          _$TaskMapLoadedImpl value, $Res Function(_$TaskMapLoadedImpl) then) =
      __$$TaskMapLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Task> tasks, String? selectedTaskId});
}

/// @nodoc
class __$$TaskMapLoadedImplCopyWithImpl<$Res>
    extends _$TaskMapStateCopyWithImpl<$Res, _$TaskMapLoadedImpl>
    implements _$$TaskMapLoadedImplCopyWith<$Res> {
  __$$TaskMapLoadedImplCopyWithImpl(
      _$TaskMapLoadedImpl _value, $Res Function(_$TaskMapLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? selectedTaskId = freezed,
  }) {
    return _then(_$TaskMapLoadedImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      selectedTaskId: freezed == selectedTaskId
          ? _value.selectedTaskId
          : selectedTaskId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TaskMapLoadedImpl implements TaskMapLoaded {
  const _$TaskMapLoadedImpl(
      {final List<Task> tasks = const [], this.selectedTaskId})
      : _tasks = tasks;

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  final String? selectedTaskId;

  @override
  String toString() {
    return 'TaskMapState.loaded(tasks: $tasks, selectedTaskId: $selectedTaskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskMapLoadedImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.selectedTaskId, selectedTaskId) ||
                other.selectedTaskId == selectedTaskId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tasks), selectedTaskId);

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskMapLoadedImplCopyWith<_$TaskMapLoadedImpl> get copyWith =>
      __$$TaskMapLoadedImplCopyWithImpl<_$TaskMapLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks, String? selectedTaskId) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(tasks, selectedTaskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks, String? selectedTaskId)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(tasks, selectedTaskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks, String? selectedTaskId)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tasks, selectedTaskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskMapInitial value) initial,
    required TResult Function(TaskMapLoading value) loading,
    required TResult Function(TaskMapLoaded value) loaded,
    required TResult Function(TaskMapError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskMapInitial value)? initial,
    TResult? Function(TaskMapLoading value)? loading,
    TResult? Function(TaskMapLoaded value)? loaded,
    TResult? Function(TaskMapError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskMapInitial value)? initial,
    TResult Function(TaskMapLoading value)? loading,
    TResult Function(TaskMapLoaded value)? loaded,
    TResult Function(TaskMapError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TaskMapLoaded implements TaskMapState {
  const factory TaskMapLoaded(
      {final List<Task> tasks,
      final String? selectedTaskId}) = _$TaskMapLoadedImpl;

  List<Task> get tasks;
  String? get selectedTaskId;

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskMapLoadedImplCopyWith<_$TaskMapLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskMapErrorImplCopyWith<$Res> {
  factory _$$TaskMapErrorImplCopyWith(
          _$TaskMapErrorImpl value, $Res Function(_$TaskMapErrorImpl) then) =
      __$$TaskMapErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TaskMapErrorImplCopyWithImpl<$Res>
    extends _$TaskMapStateCopyWithImpl<$Res, _$TaskMapErrorImpl>
    implements _$$TaskMapErrorImplCopyWith<$Res> {
  __$$TaskMapErrorImplCopyWithImpl(
      _$TaskMapErrorImpl _value, $Res Function(_$TaskMapErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TaskMapErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskMapErrorImpl implements TaskMapError {
  const _$TaskMapErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TaskMapState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskMapErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskMapErrorImplCopyWith<_$TaskMapErrorImpl> get copyWith =>
      __$$TaskMapErrorImplCopyWithImpl<_$TaskMapErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Task> tasks, String? selectedTaskId) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Task> tasks, String? selectedTaskId)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Task> tasks, String? selectedTaskId)? loaded,
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
    required TResult Function(TaskMapInitial value) initial,
    required TResult Function(TaskMapLoading value) loading,
    required TResult Function(TaskMapLoaded value) loaded,
    required TResult Function(TaskMapError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskMapInitial value)? initial,
    TResult? Function(TaskMapLoading value)? loading,
    TResult? Function(TaskMapLoaded value)? loaded,
    TResult? Function(TaskMapError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskMapInitial value)? initial,
    TResult Function(TaskMapLoading value)? loading,
    TResult Function(TaskMapLoaded value)? loaded,
    TResult Function(TaskMapError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TaskMapError implements TaskMapState {
  const factory TaskMapError(final String message) = _$TaskMapErrorImpl;

  String get message;

  /// Create a copy of TaskMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskMapErrorImplCopyWith<_$TaskMapErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
