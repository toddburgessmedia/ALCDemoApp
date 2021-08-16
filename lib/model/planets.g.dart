// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planets _$PlanetsFromJson(Map<String, dynamic> json) {
  return Planets(
    (json['planets'] as List<dynamic>)
        .map((e) => Planet.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PlanetsToJson(Planets instance) => <String, dynamic>{
      'planets': instance.planets.map((e) => e.toJson()).toList(),
    };
