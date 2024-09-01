import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_myself/providers/weather_data.dart';
import 'package:weather_app_myself/services/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map data = {};
  bool expandMore = false;
  late Future<Weather> weatherData;
  String area = "Trieu Khuc";

  @override
  void initState() {
    super.initState();
    weatherData =
        Provider.of<WeatherData>(context, listen: false).fetchWeatherData(area);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Weather App'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {
                        weatherData =
                            Provider.of<WeatherData>(context, listen: false)
                                .fetchWeatherData(area);
                      });
                    },
                  ),
                ],
              ),
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF87CEEB), // Sky blue
                      Color(0xFF00BFFF), // Bright blue
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            snapshot.data!.location.name,
                            style: const TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                                expandMore
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.white),
                            onPressed: () {
                              setState(() {
                                expandMore = !expandMore;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            snapshot.data!.location.country,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      expandMore
                          ? Center(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF87CEEB), // Sky blue
                                          Color(0xFF00BFFF), // Bright blue
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            area = "Phu Ly";
                                            weatherData =
                                                Provider.of<WeatherData>(
                                                        context,
                                                        listen: false)
                                                    .fetchWeatherData(area);
                                            expandMore = !expandMore;
                                          });
                                        },
                                        child: Text(
                                          "Phu Ly",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                offset: const Offset(0, 2),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            area = "Trieu Khuc";
                                            weatherData =
                                                Provider.of<WeatherData>(
                                                        context,
                                                        listen: false)
                                                    .fetchWeatherData(area);
                                            expandMore = !expandMore;
                                          });
                                        },
                                        child: Text(
                                          "Trieu Khuc",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                offset: const Offset(0, 2),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.location.localtime,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '${snapshot.data!.current.tempC}°C',
                                style: const TextStyle(
                                  fontSize: 48.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Image.network(
                            'https:${snapshot.data!.current.condition.icon}',
                            width: 80.0,
                            height: 80.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      Expanded(
                        child: Center(
                          child: Text(
                            snapshot.data!.current.condition.text,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SpinKitCircle(color: Colors.white, size: 50);
          }
        });
  }
}
