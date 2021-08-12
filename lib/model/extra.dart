
import 'package:json_annotation/json_annotation.dart';

part 'extra.g.dart';

@JsonSerializable()
class Extra {

  int distanceToSun;
  int distanceToEarth;
  List<String> facts;

  Extra(this.distanceToSun,this.distanceToEarth,this.facts);

  factory Extra.fromJson(Map<String,dynamic> json) => _$ExtraFromJson(json);

  Map<String,dynamic> toJson() => _$ExtraToJson(this);

}