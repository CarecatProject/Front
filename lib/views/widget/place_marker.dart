import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/customer_info_bloc.dart';
import 'canteen_detail.dart';

class PlaceMarkerPage extends StatelessWidget {
  const PlaceMarkerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerInfoBloc, CustomerInfoState>(
        builder: (context, state) {
      if (state is CustomerInfoLoaded) {
        return PlaceMarkerBody(
            userPosition: LatLng(
                state.userPosition.latitude, state.userPosition.longitude));
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
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
  PlaceMarkerBodyState();

  GoogleMapController? controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;
  LatLng? markerPosition;

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(
        () {
          final MarkerId? previousMarkerId = selectedMarker;
          if (previousMarkerId != null &&
              markers.containsKey(previousMarkerId)) {
            final Marker resetOld = markers[previousMarkerId]!
                .copyWith(iconParam: BitmapDescriptor.defaultMarker);
            markers[previousMarkerId] = resetOld;
          }
          selectedMarker = markerId;
          final Marker newMarker = tappedMarker.copyWith(
            iconParam: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen,
            ),
          );
          markers[markerId] = newMarker;

          markerPosition = null;
        },
      );

      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('고양이 밥통 ${markerId.value}'),
          actions: [
            CupertinoDialogAction(
              child: const Text('취소'),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: const Text('이동'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CanteenPage(),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _onMarkerDrag(MarkerId markerId, LatLng newPosition) async {
    setState(() {
      markerPosition = newPosition;
    });
  }

  void _onMarkerDragEnd(MarkerId markerId, LatLng newPosition) async {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        markerPosition = null;
      });
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
                content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 66),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Old position: ${tappedMarker.position}'),
                        Text('New position: $newPosition'),
                      ],
                    )));
          });
    }
  }

  /*
  TODO:
  Marker 관련 Bloc 및 Strucutre 구성
  Marker 생성 시 반경 얼마 내부에 유사 밥통이 있는지 찾아봐야함  
  */
  void _add() {
    final int markerCount = markers.length;

    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        widget.userPosition.latitude + sin(_markerIdCounter * pi / 6.0) / 80.0,
        widget.userPosition.longitude + cos(_markerIdCounter * pi / 6.0) / 80.0,
      ),
      // infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () => _onMarkerTapped(markerId),
      onDragEnd: (LatLng position) => _onMarkerDragEnd(markerId, position),
      onDrag: (LatLng position) => _onMarkerDrag(markerId, position),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  void _remove(MarkerId markerId) {
    setState(() {
      if (markers.containsKey(markerId)) {
        markers.remove(markerId);
      }
    });
  }

  Future<BitmapDescriptor> _getAssetIcon(BuildContext context) async {
    final Completer<BitmapDescriptor> bitmapIcon =
        Completer<BitmapDescriptor>();
    final ImageConfiguration config = createLocalImageConfiguration(context);

    const AssetImage('assets/red_square.png')
        .resolve(config)
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData? bytes =
          await image.image.toByteData(format: ImageByteFormat.png);
      if (bytes == null) {
        bitmapIcon.completeError(Exception('Unable to encode icon'));
        return;
      }
      final BitmapDescriptor bitmap =
          BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    }));

    return await bitmapIcon.future;
  }

  @override
  Widget build(BuildContext context) {
    final MarkerId? selectedId = selectedMarker;

    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              rotateGesturesEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: widget.userPosition,
                zoom: 15.0,
              ),
              markers: Set<Marker>.of(markers.values),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                child: const Text('Add'),
                onPressed: _add,
              ),
              TextButton(
                child: const Text('Remove'),
                onPressed:
                    selectedId == null ? null : () => _remove(selectedId),
              ),
            ],
          ),
          // Wrap(
          //   alignment: WrapAlignment.spaceEvenly,
          //   children: <Widget>[
          //     TextButton(
          //       child: const Text('change info'),
          //       onPressed:
          //           selectedId == null ? null : () => _changeInfo(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('change info anchor'),
          //       onPressed: selectedId == null
          //           ? null
          //           : () => _changeInfoAnchor(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('change alpha'),
          //       onPressed:
          //           selectedId == null ? null : () => _changeAlpha(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('change anchor'),
          //       onPressed:
          //           selectedId == null ? null : () => _changeAnchor(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('toggle draggable'),
          //       onPressed: selectedId == null
          //           ? null
          //           : () => _toggleDraggable(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('toggle flat'),
          //       onPressed:
          //           selectedId == null ? null : () => _toggleFlat(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('change position'),
          //       onPressed: selectedId == null
          //           ? null
          //           : () => _changePosition(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('change rotation'),
          //       onPressed: selectedId == null
          //           ? null
          //           : () => _changeRotation(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('toggle visible'),
          //       onPressed: selectedId == null
          //           ? null
          //           : () => _toggleVisible(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('change zIndex'),
          //       onPressed:
          //           selectedId == null ? null : () => _changeZIndex(selectedId),
          //     ),
          //     TextButton(
          //       child: const Text('set marker icon'),
          //       onPressed: selectedId == null
          //           ? null
          //           : () {
          //               _getAssetIcon(context).then(
          //                 (BitmapDescriptor icon) {
          //                   _setMarkerIcon(selectedId, icon);
          //                 },
          //               );
          //             },
          //     ),
          //   ],
          // ),
        ],
      ),
      Visibility(
        visible: markerPosition != null,
        child: Container(
          color: Colors.white70,
          height: 30,
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              markerPosition == null
                  ? Container()
                  : Expanded(child: Text("lat: ${markerPosition!.latitude}")),
              markerPosition == null
                  ? Container()
                  : Expanded(child: Text("lng: ${markerPosition!.longitude}")),
            ],
          ),
        ),
      ),
    ]);
  }
}
