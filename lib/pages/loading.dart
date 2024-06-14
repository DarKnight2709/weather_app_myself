import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_myself/services/weather.dart';

class Loading extends StatefulWidget { 
  String? area;
   Loading({super.key, this.area});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Weather? weather;

  

  Future<Weather> setInitialWeather() async {
    String jsonString = await getJsonString();
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return Weather.fromJson(jsonMap);
  }

  Future<String> getJsonString() async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=e039e98b950a430e93d92037240506&q=Thanh Tri&aqi=no'));

    await Future.delayed(const Duration(seconds: 2), () {});

    return response.body;
  }

  void getWeather() async {
    weather = await setInitialWeather();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'name': weather?.location.name,
      'country': weather?.location.country,
      'localtime': weather?.location.localtime,
      'tempC': weather?.current.tempC,
      'isDay': weather?.current.isDay == 0? false: true,
      'text': weather?.current.condition.text,
      'icon': weather?.current.condition.icon

    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
 
  
    return const Scaffold(
        body: Center(
          child: SpinKitCircle(
            color: Colors.black,
            size: 50

          ),
        )
    );
  }
}
