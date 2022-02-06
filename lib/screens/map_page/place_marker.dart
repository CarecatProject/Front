import 'dart:async';

import 'package:carecat/blocs/marker_map_bloc/marker_map_bloc.dart';
import 'package:carecat/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceMarkerPage extends StatelessWidget {
  const PlaceMarkerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final position = context.select((UserInfoBloc bloc) => bloc.position);
    return BlocProvider(
        create: (context) =>
            MarkerMapBloc()..add(MarkerMapInit(context: context)),
        child: PlaceMarkerBody(
          userPosition: LatLng(position.latitude, position.longitude),
        ));
  }
}

class PlaceMarkerBody extends StatefulWidget {
  const PlaceMarkerBody({required this.userPosition, Key? key})
      : super(key: key);
  final LatLng userPosition;

  @override
  State<StatefulWidget> createState() => PlaceMarkerBodyState();
}

typedef MarkerUpdateAction = Marker Function(Marker marker);

class PlaceMarkerBodyState extends State<PlaceMarkerBody> {
  GoogleMapController? controller;

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    // BlocListner로 MarkerClick event 처리
    return BlocBuilder<MarkerMapBloc, MarkerMapState>(
      builder: ((context, state) {
        if (state is MarkerMapLoaded) {
          Timer? _debounce;
          return GoogleMap(
              rotateGesturesEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: widget.userPosition,
                zoom: 14.0,
              ),
              markers: state.markerList,
              mapToolbarEnabled: false,
              myLocationEnabled: true,
              onCameraMove: (cameraPosition) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () async {
                  final zoom = await controller!.getZoomLevel();
                  print(
                      '$zoom & ${cameraPosition.target.latitude} & ${cameraPosition.target.longitude}');
                });
              });
        }
        return Container();
      }),
    );
  }
}
