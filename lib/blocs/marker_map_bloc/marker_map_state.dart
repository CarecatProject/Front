part of 'marker_map_bloc.dart';

abstract class MarkerMapState extends Equatable {
  const MarkerMapState();

  @override
  List<Object> get props => [];
}

class MarkerMapLoading extends MarkerMapState {
  @override
  String toString() => 'PageLoading';
}

class MarkerMapLoaded extends MarkerMapState {
  final Set<Marker> markerList;
  MarkerId? selectedId;

  MarkerMapLoaded({required this.markerList, this.selectedId});

  @override
  String toString() => 'FirstPageLoaded with ';

  @override
  List<Object> get props => [markerList];

  MarkerMapLoaded copyWith({Set<Marker>? markerList, MarkerId? selectedId}) {
    return MarkerMapLoaded(
        markerList: markerList ?? this.markerList,
        selectedId: selectedId ?? this.selectedId);
  }
}

class MarkerTapped extends MarkerMapState {
  const MarkerTapped({required this.id});

  final int id;
  @override
  String toString() => 'PageLoading';

  @override
  List<Object> get props => [id];
}
