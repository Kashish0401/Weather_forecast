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
  } //this is used when we need to fetch data which will take some time. Async will allow
// the program to continue doing next tasks while it completes the task which is taking time.
}
