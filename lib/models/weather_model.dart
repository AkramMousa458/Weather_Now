import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data['location']['localtime']
            .substring(data['location']['localtime'].length - 5),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  String getImage() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light cloud' ||
        weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy cloud' ||
        weatherStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light rain' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy cloud' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light rain' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Patchy rain possible') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.indigo;
    } else {
      return Colors.deepOrange;
    }
  }

  @override
  String toString() {
    return 'date = $date Temp = $temp Min Temp = $minTemp Max Temp = $maxTemp Name = $weatherStateName';
  }
}
