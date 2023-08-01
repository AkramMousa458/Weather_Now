// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/providers/weather_provider.dart';
import 'package:weather_now/servecies/weather_service.dart';
import '../models/weather_model.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                WeatherService weatherService = WeatherService();
                  WeatherModel? weather =
                  await weatherService.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName =
                      cityName;

                Navigator.pop(context);
              },
              decoration: InputDecoration(
                label: const Text(
                  'search',
                  style: TextStyle(fontSize: 20),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherService weatherService = WeatherService();
                        WeatherModel? weather =
                        await weatherService.getWeather(cityName: cityName!);
                        Provider.of<WeatherProvider>(context, listen: false)
                            .weatherData = weather;
                        Provider.of<WeatherProvider>(context, listen: false)
                            .cityName = cityName;

                      Navigator.pop(context);
                    },
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.search_rounded, size: 30))),
                border: const OutlineInputBorder(),
                hintText: 'Enter a City',
              ),
            ),
          ),
        ));
  }
}
