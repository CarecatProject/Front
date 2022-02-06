import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoLoading()) {
    on<UserInfoInit>(_onAppInit);
  }

  Position? _userPosition;

  get position => _userPosition;

  Future<void> _onAppInit(
    UserInfoInit event,
    Emitter emit,
  ) async {
    await getPosition();
    final response = await placemarkFromCoordinates(
        _userPosition!.latitude, _userPosition!.longitude,
        localeIdentifier: 'KO_KR');
    print(response.first.street);

    emit(UserInfoLoaded(userPosition: _userPosition!));
  }

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  Future<void> getPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    _userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }
}
