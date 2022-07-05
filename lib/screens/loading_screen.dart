import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecaster/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }
  //this is used when we need to fetch data which will take some time. Async will allow
  // the program to continue doing next tasks while it completes the task which is taking time.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Get Location'),
      ),
    );
  }
}
