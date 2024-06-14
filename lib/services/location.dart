import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location{
  String name;
  String country;
  String localtime;
  

  Location({required this.name, required this.country, required this.localtime});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  }

