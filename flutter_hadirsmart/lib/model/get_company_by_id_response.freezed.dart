// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_company_by_id_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCompanyByIdResponse _$GetCompanyByIdResponseFromJson(
    Map<String, dynamic> json) {
  return _GetCompanyByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$GetCompanyByIdResponse {
  @JsonKey(name: 'data')
  Data? get data => throw _privateConstructorUsedError;

  /// Serializes this GetCompanyByIdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetCompanyByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetCompanyByIdResponseCopyWith<GetCompanyByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCompanyByIdResponseCopyWith<$Res> {
  factory $GetCompanyByIdResponseCopyWith(GetCompanyByIdResponse value,
          $Res Function(GetCompanyByIdResponse) then) =
      _$GetCompanyByIdResponseCopyWithImpl<$Res, GetCompanyByIdResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetCompanyByIdResponseCopyWithImpl<$Res,
        $Val extends GetCompanyByIdResponse>
    implements $GetCompanyByIdResponseCopyWith<$Res> {
  _$GetCompanyByIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetCompanyByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ) as $Val);
  }

  /// Create a copy of GetCompanyByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetCompanyByIdResponseImplCopyWith<$Res>
    implements $GetCompanyByIdResponseCopyWith<$Res> {
  factory _$$GetCompanyByIdResponseImplCopyWith(
          _$GetCompanyByIdResponseImpl value,
          $Res Function(_$GetCompanyByIdResponseImpl) then) =
      __$$GetCompanyByIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetCompanyByIdResponseImplCopyWithImpl<$Res>
    extends _$GetCompanyByIdResponseCopyWithImpl<$Res,
        _$GetCompanyByIdResponseImpl>
    implements _$$GetCompanyByIdResponseImplCopyWith<$Res> {
  __$$GetCompanyByIdResponseImplCopyWithImpl(
      _$GetCompanyByIdResponseImpl _value,
      $Res Function(_$GetCompanyByIdResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetCompanyByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GetCompanyByIdResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCompanyByIdResponseImpl implements _GetCompanyByIdResponse {
  const _$GetCompanyByIdResponseImpl({@JsonKey(name: 'data') this.data});

  factory _$GetCompanyByIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCompanyByIdResponseImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final Data? data;

  @override
  String toString() {
    return 'GetCompanyByIdResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCompanyByIdResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of GetCompanyByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCompanyByIdResponseImplCopyWith<_$GetCompanyByIdResponseImpl>
      get copyWith => __$$GetCompanyByIdResponseImplCopyWithImpl<
          _$GetCompanyByIdResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCompanyByIdResponseImplToJson(
      this,
    );
  }
}

abstract class _GetCompanyByIdResponse implements GetCompanyByIdResponse {
  const factory _GetCompanyByIdResponse(
      {@JsonKey(name: 'data') final Data? data}) = _$GetCompanyByIdResponseImpl;

  factory _GetCompanyByIdResponse.fromJson(Map<String, dynamic> json) =
      _$GetCompanyByIdResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  Data? get data;

  /// Create a copy of GetCompanyByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCompanyByIdResponseImplCopyWith<_$GetCompanyByIdResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo')
  dynamic get photo => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'working_hour_start')
  String? get workingHourStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'working_hour_end')
  String? get workingHourEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'company_name') String? companyName,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'photo') dynamic photo,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'working_hour_start') String? workingHourStart,
      @JsonKey(name: 'working_hour_end') String? workingHourEnd,
      @JsonKey(name: 'status') String? status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? companyName = freezed,
    Object? description = freezed,
    Object? photo = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? workingHourStart = freezed,
    Object? workingHourEnd = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      workingHourStart: freezed == workingHourStart
          ? _value.workingHourStart
          : workingHourStart // ignore: cast_nullable_to_non_nullable
              as String?,
      workingHourEnd: freezed == workingHourEnd
          ? _value.workingHourEnd
          : workingHourEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'company_name') String? companyName,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'photo') dynamic photo,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'working_hour_start') String? workingHourStart,
      @JsonKey(name: 'working_hour_end') String? workingHourEnd,
      @JsonKey(name: 'status') String? status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? companyName = freezed,
    Object? description = freezed,
    Object? photo = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? workingHourStart = freezed,
    Object? workingHourEnd = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      workingHourStart: freezed == workingHourStart
          ? _value.workingHourStart
          : workingHourStart // ignore: cast_nullable_to_non_nullable
              as String?,
      workingHourEnd: freezed == workingHourEnd
          ? _value.workingHourEnd
          : workingHourEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'company_name') this.companyName,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'photo') this.photo,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'working_hour_start') this.workingHourStart,
      @JsonKey(name: 'working_hour_end') this.workingHourEnd,
      @JsonKey(name: 'status') this.status,
      this.createdAt,
      this.updatedAt});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'photo')
  final dynamic photo;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'longitude')
  final double? longitude;
  @override
  @JsonKey(name: 'working_hour_start')
  final String? workingHourStart;
  @override
  @JsonKey(name: 'working_hour_end')
  final String? workingHourEnd;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Data(id: $id, companyName: $companyName, description: $description, photo: $photo, address: $address, latitude: $latitude, longitude: $longitude, workingHourStart: $workingHourStart, workingHourEnd: $workingHourEnd, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.workingHourStart, workingHourStart) ||
                other.workingHourStart == workingHourStart) &&
            (identical(other.workingHourEnd, workingHourEnd) ||
                other.workingHourEnd == workingHourEnd) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      companyName,
      description,
      const DeepCollectionEquality().hash(photo),
      address,
      latitude,
      longitude,
      workingHourStart,
      workingHourEnd,
      status,
      createdAt,
      updatedAt);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'company_name') final String? companyName,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'photo') final dynamic photo,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'latitude') final double? latitude,
      @JsonKey(name: 'longitude') final double? longitude,
      @JsonKey(name: 'working_hour_start') final String? workingHourStart,
      @JsonKey(name: 'working_hour_end') final String? workingHourEnd,
      @JsonKey(name: 'status') final String? status,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'photo')
  dynamic get photo;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'longitude')
  double? get longitude;
  @override
  @JsonKey(name: 'working_hour_start')
  String? get workingHourStart;
  @override
  @JsonKey(name: 'working_hour_end')
  String? get workingHourEnd;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
