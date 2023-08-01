import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_now/models/weather_model.dart';

class WeatherService {
  String baseURl = 'http://api.weatherapi.com/v1';
  String apiKey = '4b32e0602bab413fb99182338232107';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try{
      Uri url =
      Uri.parse('$baseURl/forecast.json?key=$apiKey&q=$cityName&days=3');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

       weather = WeatherModel.fromJson(data);

    }catch(ex){
      // ignore: avoid_print
      print(ex);
    }
    return weather;
  }
}
