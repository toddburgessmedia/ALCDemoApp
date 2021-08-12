import 'package:json_annotation/json_annotation.dart';
import 'package:mars_flutter/model/extra.dart';

part 'planet.g.dart';

@JsonSerializable(explicitToJson: true)
class Planet {

  String planetName;
  int diameter;
  String imageThumbnail;
  Extra extra;

  Planet(
    this.planetName,
    this.diameter,
    this.imageThumbnail,
    this.extra
  );

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetToJson(this);


}