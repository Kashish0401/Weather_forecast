import 'package:flutter/material.dart';
import 'package:weather_forecaster/services/location.dart';
import 'package:weather_forecaster/services/networking.dart';

const api = '0eb709f297f121d5efd6dcb829ba70a3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude = 77.64646;
  double latitude = 27.50821;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    Networking networking = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api');

    var weatherData = await networking.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
