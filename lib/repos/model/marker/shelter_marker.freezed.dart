// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shelter_marker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShelterMarker _$ShelterMarkerFromJson(Map<String, dynamic> json) {
  return _ShelterMarker.fromJson(json);
}

/// @nodoc
class _$ShelterMarkerTearOff {
  const _$ShelterMarkerTearOff();

  _ShelterMarker call(
      {required int id, required double lat, required double lng}) {
    return _ShelterMarker(
      id: id,
      lat: lat,
      lng: lng,
    );
  }

  ShelterMarker fromJson(Map<String, Object?> json) {
    return ShelterMarker.fromJson(json);
  }
}

/// @nodoc
const $ShelterMarker = _$ShelterMarkerTearOff();

/// @nodoc
mixin _$ShelterMarker {
  int get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShelterMarkerCopyWith<ShelterMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterMarkerCopyWith<$Res> {
  factory $ShelterMarkerCopyWith(
          ShelterMarker value, $Res Function(ShelterMarker) then) =
      _$ShelterMarkerCopyWithImpl<$Res>;
  $Res call({int id, double lat, double lng});
}

/// @nodoc
class _$ShelterMarkerCopyWithImpl<$Res>
    implements $ShelterMarkerCopyWith<$Res> {
  _$ShelterMarkerCopyWithImpl(this._value, this._then);

  final ShelterMarker _value;
  // ignore: unused_field
  final $Res Function(ShelterMarker) _then;

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
abstract class _$ShelterMarkerCopyWith<$Res>
    implements $ShelterMarkerCopyWith<$Res> {
  factory _$ShelterMarkerCopyWith(
          _ShelterMarker value, $Res Function(_ShelterMarker) then) =
      __$ShelterMarkerCopyWithImpl<$Res>;
  @override
  $Res call({int id, double lat, double lng});
}

/// @nodoc
class __$ShelterMarkerCopyWithImpl<$Res>
    extends _$ShelterMarkerCopyWithImpl<$Res>
    implements _$ShelterMarkerCopyWith<$Res> {
  __$ShelterMarkerCopyWithImpl(
      _ShelterMarker _value, $Res Function(_ShelterMarker) _then)
      : super(_value, (v) => _then(v as _ShelterMarker));

  @override
  _ShelterMarker get _value => super._value as _ShelterMarker;

  @override
  $Res call({
    Object? id = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_ShelterMarker(
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
class _$_ShelterMarker implements _ShelterMarker {
  _$_ShelterMarker({required this.id, required this.lat, required this.lng});

  factory _$_ShelterMarker.fromJson(Map<String, dynamic> json) =>
      _$$_ShelterMarkerFromJson(json);

  @override
  final int id;
  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'ShelterMarker(id: $id, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShelterMarker &&
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
  _$ShelterMarkerCopyWith<_ShelterMarker> get copyWith =>
      __$ShelterMarkerCopyWithImpl<_ShelterMarker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShelterMarkerToJson(this);
  }
}

abstract class _ShelterMarker implements ShelterMarker {
  factory _ShelterMarker(
      {required int id,
      required double lat,
      required double lng}) = _$_ShelterMarker;

  factory _ShelterMarker.fromJson(Map<String, dynamic> json) =
      _$_ShelterMarker.fromJson;

  @override
  int get id;
  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$ShelterMarkerCopyWith<_ShelterMarker> get copyWith =>
      throw _privateConstructorUsedError;
}
