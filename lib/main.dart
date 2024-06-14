import 'package:flutter/material.dart';
import 'package:weather_app_myself/pages/home.dart';
import 'package:weather_app_myself/pages/loading.dart';
import 'package:weather_app_myself/pages/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      
      routes: {
        '/': (context) =>  Loading(),
        '/home': (context) => const MyHomePage(),
        '/location': (context) => const ChooseLocation(),

      },
      
    );
  }
}