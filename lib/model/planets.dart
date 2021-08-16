

import 'package:json_annotation/json_annotation.dart';
import 'package:mars_flutter/model/planet.dart';

part 'planets.g.dart';

@JsonSerializable(explicitToJson: true)
class Planets {

  List<Planet> planets;

  Planets(this.planets);

  factory Planets.fromJson(Map<String,dynamic> json) => _$PlanetsFromJson(json);

  Map<String,dynamic> toJson() => _$PlanetsToJson(this);


}