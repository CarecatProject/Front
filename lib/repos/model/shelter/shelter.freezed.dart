// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shelter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Shelter _$ShelterFromJson(Map<String, dynamic> json) {
  return _Shelter.fromJson(json);
}

/// @nodoc
class _$ShelterTearOff {
  const _$ShelterTearOff();

  _Shelter call({required int id, required double lat, required double lng}) {
    return _Shelter(
      id: id,
      lat: lat,
      lng: lng,
    );
  }

  Shelter fromJson(Map<String, Object?> json) {
    return Shelter.fromJson(json);
  }
}

/// @nodoc
const $Shelter = _$ShelterTearOff();

/// @nodoc
mixin _$Shelter {
  int get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShelterCopyWith<Shelter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterCopyWith<$Res> {
  factory $ShelterCopyWith(Shelter value, $Res Function(Shelter) then) =
      _$ShelterCopyWithImpl<$Res>;
  $Res call({int id, double lat, double lng});
}

/// @nodoc
class _$ShelterCopyWithImpl<$Res> implements $ShelterCopyWith<$Res> {
  _$ShelterCopyWithImpl(this._value, this._then);

  final Shelter _value;
  // ignore: unused_field
  final $Res Function(Shelter) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ShelterCopyWith<$Res> implements $ShelterCopyWith<$Res> {
  factory _$ShelterCopyWith(_Shelter value, $Res Function(_Shelter) then) =
      __$ShelterCopyWithImpl<$Res>;
  @override
  $Res call({int id, double lat, double lng});
}

/// @nodoc
class __$ShelterCopyWithImpl<$Res> extends _$ShelterCopyWithImpl<$Res>
    implements _$ShelterCopyWith<$Res> {
  __$ShelterCopyWithImpl(_Shelter _value, $Res Function(_Shelter) _then)
      : super(_value, (v) => _then(v as _Shelter));

  @override
  _Shelter get _value => super._value as _Shelter;

  @override
  $Res call({
    Object? id = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_Shelter(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Shelter implements _Shelter {
  _$_Shelter({required this.id, required this.lat, required this.lng});

  factory _$_Shelter.fromJson(Map<String, dynamic> json) =>
      _$$_ShelterFromJson(json);

  @override
  final int id;
  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'Shelter(id: $id, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Shelter &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng));

  @JsonKey(ignore: true)
  @override
  _$ShelterCopyWith<_Shelter> get copyWith =>
      __$ShelterCopyWithImpl<_Shelter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShelterToJson(this);
  }
}

abstract class _Shelter implements Shelter {
  factory _Shelter(
      {required int id, required double lat, required double lng}) = _$_Shelter;

  factory _Shelter.fromJson(Map<String, dynamic> json) = _$_Shelter.fromJson;

  @override
  int get id;
  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$ShelterCopyWith<_Shelter> get copyWith =>
      throw _privateConstructorUsedError;
}
