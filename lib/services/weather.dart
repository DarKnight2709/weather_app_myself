import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_myself/services/current.dart';
import 'package:weather_app_myself/services/location.dart';


part 'weather.g.dart';

@JsonSerializable()
class Weather{
  final Location location;
  final Current current;
  


  Weather({required this.location, required this.current});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);  

}
