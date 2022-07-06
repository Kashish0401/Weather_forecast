import 'package:flutter/material.dart';
import 'package:weather_forecaster/services/location.dart';
import 'package:weather_forecaster/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_forecaster/screens/location_screen.dart';

const api = '0eb709f297f121d5efd6dcb829ba70a3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');

    var weatherData = await networking.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitRipple(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
