import 'package:weather_forecaster/services/location.dart';
import 'package:weather_forecaster/services/networking.dart';

const api = '0eb709f297f121d5efd6dcb829ba70a3';
const String url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(
        '$url?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');

    return await networking.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
