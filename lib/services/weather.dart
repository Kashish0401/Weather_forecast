import 'package:weather_forecaster/services/location.dart';
import 'package:weather_forecaster/services/networking.dart';

const api = '0eb709f297f121d5efd6dcb829ba70a3';
const String WeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getWeatherCity(var TypedName) async {
    Networking networking =
        Networking('$WeatherUrl?q=$TypedName&appid=$api&units=metric');
    return await networking.getData();
  }

  Future<dynamic> getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(
        '$WeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');

    return await networking.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
