// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hrd_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HrdDashboardState {
  GetUserByIdResponse? get getUserByIdResponse =>
      throw _privateConstructorUsedError;
  set getUserByIdResponse(GetUserByIdResponse? value) =>
      throw _privateConstructorUsedError;
  GetAttendanceStatusTodayResponse? get getAttendanceStatusTodayResponse =>
      throw _privateConstructorUsedError;
  set getAttendanceStatusTodayResponse(
          GetAttendanceStatusTodayResponse? value) =>
      throw _privateConstructorUsedError;

  /// Create a copy of HrdDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HrdDashboardStateCopyWith<HrdDashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HrdDashboardStateCopyWith<$Res> {
  factory $HrdDashboardStateCopyWith(
          HrdDashboardState value, $Res Function(HrdDashboardState) then) =
      _$HrdDashboardStateCopyWithImpl<$Res, HrdDashboardState>;
  @useResult
  $Res call(
      {GetUserByIdResponse? getUserByIdResponse,
      GetAttendanceStatusTodayResponse? getAttendanceStatusTodayResponse});

  $GetUserByIdResponseCopyWith<$Res>? get getUserByIdResponse;
}

/// @nodoc
class _$HrdDashboardStateCopyWithImpl<$Res, $Val extends HrdDashboardState>
    implements $HrdDashboardStateCopyWith<$Res> {
  _$HrdDashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HrdDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUserByIdResponse = freezed,
    Object? getAttendanceStatusTodayResponse = freezed,
  }) {
    return _then(_value.copyWith(
      getUserByIdResponse: freezed == getUserByIdResponse
          ? _value.getUserByIdResponse
          : getUserByIdResponse // ignore: cast_nullable_to_non_nullable
              as GetUserByIdResponse?,
      getAttendanceStatusTodayResponse: freezed ==
              getAttendanceStatusTodayResponse
          ? _value.getAttendanceStatusTodayResponse
          : getAttendanceStatusTodayResponse // ignore: cast_nullable_to_non_nullable
              as GetAttendanceStatusTodayResponse?,
    ) as $Val);
  }

  /// Create a copy of HrdDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetUserByIdResponseCopyWith<$Res>? get getUserByIdResponse {
    if (_value.getUserByIdResponse == null) {
      return null;
    }

    return $GetUserByIdResponseCopyWith<$Res>(_value.getUserByIdResponse!,
        (value) {
      return _then(_value.copyWith(getUserByIdResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HrdDashboardStateImplCopyWith<$Res>
    implements $HrdDashboardStateCopyWith<$Res> {
  factory _$$HrdDashboardStateImplCopyWith(_$HrdDashboardStateImpl value,
          $Res Function(_$HrdDashboardStateImpl) then) =
      __$$HrdDashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GetUserByIdResponse? getUserByIdResponse,
      GetAttendanceStatusTodayResponse? getAttendanceStatusTodayResponse});

  @override
  $GetUserByIdResponseCopyWith<$Res>? get getUserByIdResponse;
}

/// @nodoc
class __$$HrdDashboardStateImplCopyWithImpl<$Res>
    extends _$HrdDashboardStateCopyWithImpl<$Res, _$HrdDashboardStateImpl>
    implements _$$HrdDashboardStateImplCopyWith<$Res> {
  __$$HrdDashboardStateImplCopyWithImpl(_$HrdDashboardStateImpl _value,
      $Res Function(_$HrdDashboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HrdDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUserByIdResponse = freezed,
    Object? getAttendanceStatusTodayResponse = freezed,
  }) {
    return _then(_$HrdDashboardStateImpl(
      getUserByIdResponse: freezed == getUserByIdResponse
          ? _value.getUserByIdResponse
          : getUserByIdResponse // ignore: cast_nullable_to_non_nullable
              as GetUserByIdResponse?,
      getAttendanceStatusTodayResponse: freezed ==
              getAttendanceStatusTodayResponse
          ? _value.getAttendanceStatusTodayResponse
          : getAttendanceStatusTodayResponse // ignore: cast_nullable_to_non_nullable
              as GetAttendanceStatusTodayResponse?,
    ));
  }
}

/// @nodoc

class _$HrdDashboardStateImpl implements _HrdDashboardState {
  _$HrdDashboardStateImpl(
      {this.getUserByIdResponse = null,
      this.getAttendanceStatusTodayResponse = null});

  @override
  @JsonKey()
  GetUserByIdResponse? getUserByIdResponse;
  @override
  @JsonKey()
  GetAttendanceStatusTodayResponse? getAttendanceStatusTodayResponse;

  @override
  String toString() {
    return 'HrdDashboardState(getUserByIdResponse: $getUserByIdResponse, getAttendanceStatusTodayResponse: $getAttendanceStatusTodayResponse)';
  }

  /// Create a copy of HrdDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HrdDashboardStateImplCopyWith<_$HrdDashboardStateImpl> get copyWith =>
      __$$HrdDashboardStateImplCopyWithImpl<_$HrdDashboardStateImpl>(
          this, _$identity);
}

abstract class _HrdDashboardState implements HrdDashboardState {
  factory _HrdDashboardState(
          {GetUserByIdResponse? getUserByIdResponse,
          GetAttendanceStatusTodayResponse? getAttendanceStatusTodayResponse}) =
      _$HrdDashboardStateImpl;

  @override
  GetUserByIdResponse? get getUserByIdResponse;
  set getUserByIdResponse(GetUserByIdResponse? value);
  @override
  GetAttendanceStatusTodayResponse? get getAttendanceStatusTodayResponse;
  set getAttendanceStatusTodayResponse(GetAttendanceStatusTodayResponse? value);

  /// Create a copy of HrdDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HrdDashboardStateImplCopyWith<_$HrdDashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
