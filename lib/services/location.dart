import 'package:geolocator/geolocator.dart';

class Location {
  double longitude = 77.64646;
  double latitude = 27.50821;

  Future<void> getCurrentLocation() async {
    LocationPermission permissionRequest = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
