import 'package:flutter/material.dart';
import 'package:weather_now/providers/weather_provider.dart';
import 'pages/home_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context){
            return WeatherProvider();
          },
          child: const WeatherNow())
  );
}

class WeatherNow extends StatelessWidget {
  const WeatherNow({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Weather Now',
        theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
    );
  }
}
