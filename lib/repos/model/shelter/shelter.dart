import 'package:freezed_annotation/freezed_annotation.dart';

part 'shelter.freezed.dart';
part 'shelter.g.dart';

@freezed
class Shelter with _$Shelter {
  factory Shelter({
    required int id,
    required double lat,
    required double lng,
  }) = _Shelter;

  factory Shelter.fromJson(Map<String, dynamic> json) =>
      _$ShelterFromJson(json);
}
