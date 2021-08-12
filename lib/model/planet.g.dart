// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planet _$PlanetFromJson(Map<String, dynamic> json) {
  return Planet(
    json['planetName'] as String,
    json['diameter'] as int,
    json['imageThumbnail'] as String,
    Extra.fromJson(json['extra'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlanetToJson(Planet instance) => <String, dynamic>{
      'planetName': instance.planetName,
      'diameter': instance.diameter,
      'imageThumbnail': instance.imageThumbnail,
      'extra': instance.extra.toJson(),
    };
