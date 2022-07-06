import 'package:flutter/material.dart';
import 'package:weather_forecaster/utilities/constants.dart';
import 'package:weather_forecaster/services/weather.dart';
import 'package:weather_forecaster/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen(this.locationWeather);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp = 24;
  String weatherIcon = '';
  String message = '';
  String cityName = '';
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) return;
      double temp = weatherdata['main']['temp'];
      this.temp = temp.toInt();
      var condition = weatherdata['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      cityName = weatherdata['name'];
      message = weatherModel.getMessage(this.temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      updateUI(await weatherModel.getCurrentLocation());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var TypedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (TypedName != null) {
                        //print(TypedName);
                        var weatherdata =
                            await weatherModel.getWeatherCity(TypedName);
                        updateUI(weatherdata);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
