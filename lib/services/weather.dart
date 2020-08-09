import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';

const String apiKey = '38190e8933afffc02842b922c74583a2';
const String openWeatherMapURl =
    'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> cityWeatherData({@required cityName}) async {
    NetworkHelper networkHelper = NetworkHelper(
        '${openWeatherMapURl}q=$cityName&appid=$apiKey&units=metric');

    return await networkHelper.getNetworkData();
  }

  Future<dynamic> locationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('latitude: ${location.latitude}   longitude: ${location.longitude}');
    NetworkHelper networkHelper = NetworkHelper(
        '${openWeatherMapURl}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getNetworkData();
    return weatherData;
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
      return 'You\'ll need muffler and gloves';
    } else {
      return 'Bring a jacket just in case';
    }
  }
}
