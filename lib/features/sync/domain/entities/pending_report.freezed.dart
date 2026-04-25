// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PendingReport {
  String get id => throw _privateConstructorUsedError;
  DamageType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get savedAt => throw _privateConstructorUsedError;

  /// Create a copy of PendingReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingReportCopyWith<PendingReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingReportCopyWith<$Res> {
  factory $PendingReportCopyWith(
          PendingReport value, $Res Function(PendingReport) then) =
      _$PendingReportCopyWithImpl<$Res, PendingReport>;
  @useResult
  $Res call({String id, DamageType type, String title, DateTime savedAt});
}

/// @nodoc
class _$PendingReportCopyWithImpl<$Res, $Val extends PendingReport>
    implements $PendingReportCopyWith<$Res> {
  _$PendingReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? savedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DamageType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingReportImplCopyWith<$Res>
    implements $PendingReportCopyWith<$Res> {
  factory _$$PendingReportImplCopyWith(
          _$PendingReportImpl value, $Res Function(_$PendingReportImpl) then) =
      __$$PendingReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DamageType type, String title, DateTime savedAt});
}

/// @nodoc
class __$$PendingReportImplCopyWithImpl<$Res>
    extends _$PendingReportCopyWithImpl<$Res, _$PendingReportImpl>
    implements _$$PendingReportImplCopyWith<$Res> {
  __$$PendingReportImplCopyWithImpl(
      _$PendingReportImpl _value, $Res Function(_$PendingReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of PendingReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? savedAt = null,
  }) {
    return _then(_$PendingReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DamageType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$PendingReportImpl implements _PendingReport {
  const _$PendingReportImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.savedAt});

  @override
  final String id;
  @override
  final DamageType type;
  @override
  final String title;
  @override
  final DateTime savedAt;

  @override
  String toString() {
    return 'PendingReport(id: $id, type: $type, title: $title, savedAt: $savedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, savedAt);

  /// Create a copy of PendingReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingReportImplCopyWith<_$PendingReportImpl> get copyWith =>
      __$$PendingReportImplCopyWithImpl<_$PendingReportImpl>(this, _$identity);
}

abstract class _PendingReport implements PendingReport {
  const factory _PendingReport(
      {required final String id,
      required final DamageType type,
      required final String title,
      required final DateTime savedAt}) = _$PendingReportImpl;

  @override
  String get id;
  @override
  DamageType get type;
  @override
  String get title;
  @override
  DateTime get savedAt;

  /// Create a copy of PendingReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingReportImplCopyWith<_$PendingReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
