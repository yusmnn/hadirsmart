// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserRequestDetailState {
  String? get requestType => throw _privateConstructorUsedError;
  set requestType(String? value) => throw _privateConstructorUsedError;

  /// Create a copy of UserRequestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRequestDetailStateCopyWith<UserRequestDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestDetailStateCopyWith<$Res> {
  factory $UserRequestDetailStateCopyWith(UserRequestDetailState value,
          $Res Function(UserRequestDetailState) then) =
      _$UserRequestDetailStateCopyWithImpl<$Res, UserRequestDetailState>;
  @useResult
  $Res call({String? requestType});
}

/// @nodoc
class _$UserRequestDetailStateCopyWithImpl<$Res,
        $Val extends UserRequestDetailState>
    implements $UserRequestDetailStateCopyWith<$Res> {
  _$UserRequestDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRequestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestType = freezed,
  }) {
    return _then(_value.copyWith(
      requestType: freezed == requestType
          ? _value.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRequestDetailStateImplCopyWith<$Res>
    implements $UserRequestDetailStateCopyWith<$Res> {
  factory _$$UserRequestDetailStateImplCopyWith(
          _$UserRequestDetailStateImpl value,
          $Res Function(_$UserRequestDetailStateImpl) then) =
      __$$UserRequestDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? requestType});
}

/// @nodoc
class __$$UserRequestDetailStateImplCopyWithImpl<$Res>
    extends _$UserRequestDetailStateCopyWithImpl<$Res,
        _$UserRequestDetailStateImpl>
    implements _$$UserRequestDetailStateImplCopyWith<$Res> {
  __$$UserRequestDetailStateImplCopyWithImpl(
      _$UserRequestDetailStateImpl _value,
      $Res Function(_$UserRequestDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRequestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestType = freezed,
  }) {
    return _then(_$UserRequestDetailStateImpl(
      requestType: freezed == requestType
          ? _value.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserRequestDetailStateImpl implements _UserRequestDetailState {
  _$UserRequestDetailStateImpl({this.requestType = null});

  @override
  @JsonKey()
  String? requestType;

  @override
  String toString() {
    return 'UserRequestDetailState(requestType: $requestType)';
  }

  /// Create a copy of UserRequestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRequestDetailStateImplCopyWith<_$UserRequestDetailStateImpl>
      get copyWith => __$$UserRequestDetailStateImplCopyWithImpl<
          _$UserRequestDetailStateImpl>(this, _$identity);
}

abstract class _UserRequestDetailState implements UserRequestDetailState {
  factory _UserRequestDetailState({String? requestType}) =
      _$UserRequestDetailStateImpl;

  @override
  String? get requestType;
  set requestType(String? value);

  /// Create a copy of UserRequestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRequestDetailStateImplCopyWith<_$UserRequestDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
