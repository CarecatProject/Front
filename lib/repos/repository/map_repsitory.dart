import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRepository {
  Future<List<Marker>> markerJsonToData(json) async {
    final response = await rootBundle.loadString('assets/shelter.json');
    final data = jsonDecode(response);

    print(data);

    // final result = json['shelters'];
    // print(result);

    final List<Marker> _response = [
      ...data.map(
        (detail) => Marker(
          markerId: MarkerId(detail['id']),
          position:
              LatLng(double.parse(detail['lat']), double.parse(detail['lng'])),
        ),
      )
    ];

    return _response;
  }
}
