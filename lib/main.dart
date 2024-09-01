import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_myself/pages/home.dart';
import 'package:weather_app_myself/providers/weather_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage()
      ),
    );
  }
}