// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extra _$ExtraFromJson(Map<String, dynamic> json) {
  return Extra(
    json['distanceToSun'] as int,
    json['distanceToEarth'] as int,
    (json['facts'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'distanceToSun': instance.distanceToSun,
      'distanceToEarth': instance.distanceToEarth,
      'facts': instance.facts,
    };
