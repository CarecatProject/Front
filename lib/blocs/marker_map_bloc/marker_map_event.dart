part of 'marker_map_bloc.dart';

abstract class MarkerMapEvent extends Equatable {
  const MarkerMapEvent();

  @override
  List<Object> get props => [];
}

class MarkerMapInit extends MarkerMapEvent {
  final BuildContext context;
  const MarkerMapInit({required this.context});

  @override
  String toString() => 'Pageinit';
}

class MarkerAdd extends MarkerMapEvent {
  final Position userPoisition;
  const MarkerAdd({required this.userPoisition});

  @override
  String toString() => 'MarkerAdd';
}
