import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_myself/services/weather.dart';

class WeatherData extends ChangeNotifier {
  Weather? _weather;
  get weather => _weather;

  Future<Weather> fetchWeatherData(String area) async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=e039e98b950a430e93d92037240506&q=$area&aqi=no'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to connect to the server');
    }
    
  }

}
