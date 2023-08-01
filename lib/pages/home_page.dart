import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_now/models/weather_model.dart';
import 'package:weather_now/pages/search_page.dart';
import 'package:weather_now/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Now'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 26,
              ))
        ],
      ),
      body: weatherData == null
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  Text(
                    'There is no weather 🌥 now',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Start searching 🔎',
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.5,
                      color: Colors.black54,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            )
          : Container(
              // color: Colors.blueGrey,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    Text(
                      '${Provider.of<WeatherProvider>(context).cityName}'
                              .characters
                              .first
                              .toUpperCase() +
                          '${Provider.of<WeatherProvider>(context).cityName}'.substring(1),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Updated at : ${weatherData!.date}',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/clear.png',
                      width: 125,
                    ),
                    const Spacer(),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: weatherData!.getThemeColor(),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${weatherData!.temp.toInt()}',
                            style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Column(
                            children: [
                              Text(
                                'max : ${weatherData!.maxTemp.toInt()}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'min : ${weatherData!.minTemp.toInt()}',
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(weatherData!.weatherStateName,
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const Spacer(),
                  ],
                ),
              ),
            ),
    );
  }
}
//Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               weatherData!.getThemeColor(),
//               weatherData!.getThemeColor()[300]!,
//               weatherData!.getThemeColor()[100]!
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter
//           )
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Spacer(),
//               Text(
//                 '${Provider.of<WeatherProvider>(context).cityName}',
//                 style: const TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 'Updated : ${weatherData!.date}',
//                 style: const TextStyle(fontSize: 20),
//               ),
//               const Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Image.asset(''),
//                   // Text('image'),
//                   Image.asset(weatherData!.getImage()),
//                   Text(
//                     '${weatherData!.temp.toInt()}',
//                     style: const TextStyle(
//                         fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                   Column(
//                     children: [Text('max : ${weatherData!.maxTemp.toInt()}'), Text('min : ${weatherData!.minTemp.toInt()}')],
//                   )
//                 ],
//               ),
//               const Spacer(),
//               Text(weatherData!.weatherStateName,
//                   style: const TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   )),
//               const Spacer(),
//             ],
//           ),
//         ),
//       )
