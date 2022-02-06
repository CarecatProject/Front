import 'package:bloc/bloc.dart';
import 'package:carecat/repos/repository/map_repsitory.dart';
import 'package:carecat/screens/shelter_page/shelter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'marker_map_event.dart';
part 'marker_map_state.dart';

class MarkerMapBloc extends Bloc<MarkerMapEvent, MarkerMapState> {
  MarkerMapBloc() : super(MarkerMapLoading()) {
    on<MarkerMapInit>(_onAppInit);
    on<MarkerAdd>(_onMarkerAddRequest);
  }

  final _mapRepository = MapRepository();

  Future<void> _onAppInit(
    MarkerMapInit event,
    Emitter emit,
  ) async {
    // final jsonData =
    final _response =
        await _mapRepository.markerJsonToData('assets/shelter.json');

    List<Marker> _data = [
      ..._response.map(
        (e) => e.copyWith(
            //onTapParam: () => tapMarker(e.markerId),
            onTapParam: () => showDialog(
                context: event.context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: Text('고양이 밥통 ${e.markerId}'),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('취소'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoDialogAction(
                        child: const Text('이동'),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShelterPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                })),
      ),
    ];

    emit(MarkerMapLoaded(markerList: _data.toSet()));
  }

  Future<void> _onMarkerAddRequest(
    MarkerAdd event,
    Emitter emit,
  ) async {
    // POST 후 리턴 값 받아야 함
    final state = this.state;
    if (state is MarkerMapLoaded) {
      List<Marker> markers = [...state.markerList];
      final MarkerId markerId = MarkerId('${state.markerList.length + 2}');

      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          event.userPoisition.latitude,
          event.userPoisition.longitude,
        ),
        // infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      );

      markers.add(marker);

      emit(state.copyWith(markerList: markers.toSet()));
    }
  }
}
