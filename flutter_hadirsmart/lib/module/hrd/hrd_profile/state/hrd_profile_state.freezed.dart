// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hrd_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HrdProfileState {
  GetUserByIdResponse? get getUserByIdResponse =>
      throw _privateConstructorUsedError;
  set getUserByIdResponse(GetUserByIdResponse? value) =>
      throw _privateConstructorUsedError;

  /// Create a copy of HrdProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HrdProfileStateCopyWith<HrdProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HrdProfileStateCopyWith<$Res> {
  factory $HrdProfileStateCopyWith(
          HrdProfileState value, $Res Function(HrdProfileState) then) =
      _$HrdProfileStateCopyWithImpl<$Res, HrdProfileState>;
  @useResult
  $Res call({GetUserByIdResponse? getUserByIdResponse});

  $GetUserByIdResponseCopyWith<$Res>? get getUserByIdResponse;
}

/// @nodoc
class _$HrdProfileStateCopyWithImpl<$Res, $Val extends HrdProfileState>
    implements $HrdProfileStateCopyWith<$Res> {
  _$HrdProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HrdProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUserByIdResponse = freezed,
  }) {
    return _then(_value.copyWith(
      getUserByIdResponse: freezed == getUserByIdResponse
          ? _value.getUserByIdResponse
          : getUserByIdResponse // ignore: cast_nullable_to_non_nullable
              as GetUserByIdResponse?,
    ) as $Val);
  }

  /// Create a copy of HrdProfileState
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
abstract class _$$HrdProfileStateImplCopyWith<$Res>
    implements $HrdProfileStateCopyWith<$Res> {
  factory _$$HrdProfileStateImplCopyWith(_$HrdProfileStateImpl value,
          $Res Function(_$HrdProfileStateImpl) then) =
      __$$HrdProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetUserByIdResponse? getUserByIdResponse});

  @override
  $GetUserByIdResponseCopyWith<$Res>? get getUserByIdResponse;
}

/// @nodoc
class __$$HrdProfileStateImplCopyWithImpl<$Res>
    extends _$HrdProfileStateCopyWithImpl<$Res, _$HrdProfileStateImpl>
    implements _$$HrdProfileStateImplCopyWith<$Res> {
  __$$HrdProfileStateImplCopyWithImpl(
      _$HrdProfileStateImpl _value, $Res Function(_$HrdProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HrdProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUserByIdResponse = freezed,
  }) {
    return _then(_$HrdProfileStateImpl(
      getUserByIdResponse: freezed == getUserByIdResponse
          ? _value.getUserByIdResponse
          : getUserByIdResponse // ignore: cast_nullable_to_non_nullable
              as GetUserByIdResponse?,
    ));
  }
}

/// @nodoc

class _$HrdProfileStateImpl implements _HrdProfileState {
  _$HrdProfileStateImpl({this.getUserByIdResponse = null});

  @override
  @JsonKey()
  GetUserByIdResponse? getUserByIdResponse;

  @override
  String toString() {
    return 'HrdProfileState(getUserByIdResponse: $getUserByIdResponse)';
  }

  /// Create a copy of HrdProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HrdProfileStateImplCopyWith<_$HrdProfileStateImpl> get copyWith =>
      __$$HrdProfileStateImplCopyWithImpl<_$HrdProfileStateImpl>(
          this, _$identity);
}

abstract class _HrdProfileState implements HrdProfileState {
  factory _HrdProfileState({GetUserByIdResponse? getUserByIdResponse}) =
      _$HrdProfileStateImpl;

  @override
  GetUserByIdResponse? get getUserByIdResponse;
  set getUserByIdResponse(GetUserByIdResponse? value);

  /// Create a copy of HrdProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HrdProfileStateImplCopyWith<_$HrdProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
