import 'package:freezed_annotation/freezed_annotation.dart';

part 'shelter_marker.freezed.dart';
part 'shelter_marker.g.dart';

@freezed
class ShelterMarker with _$ShelterMarker {
  factory ShelterMarker({
    required int id,
    required double lat,
    required double lng,
  }) = _ShelterMarker;

  factory ShelterMarker.fromJson(Map<String, dynamic> json) =>
      _$ShelterMarkerFromJson(json);
}
