
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/repository/mars_service.dart';

class MarsRepository {

  late ChopperClient chopper;

  MarsRepository() {
    chopper = ChopperClient(
      services: [
        MarsService.create()
      ],
      converter: JsonConverter(),
    );
  }

  Future<Planet> getMars() async {

    final marsService = MarsService.create(chopper);
    final response = await marsService.getMars();
    final jsonDate = json.decode(response.bodyString);

    final marsList = Planet.fromJson(jsonDate);

    return marsList;

  }

  Future<List<Planet>> getPlanets() async {

    List<Planet> planets = [];

    final marsService = MarsService.create(chopper);
    final response = await marsService.getMars();
    final jsonDate = json.decode(response.bodyString);

    final marsList = Planet.fromJson(jsonDate);

    planets.add(marsList);
    return planets;

  }

}