
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/model/planets.dart';
import 'package:mars_flutter/repository/dummy_data.dart';
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
    final jsonData = json.decode(response.bodyString);

    // final jsonData = json.decode(DummyData.marsData);
    final marsList = Planet.fromJson(jsonData);

    return marsList;

  }

  Future<Planets> getPlanets() async {

    //networking version
    // final marsService = MarsService.create(chopper);
    // final response = await marsService.getMars();
    // final jsonDate = json.decode(response.bodyString);

    //dummy version
    final response = DummyData.getPlanets();
    final jsonData = json.decode(response);
    final planets = Planets.fromJson(jsonData);

    return planets;
  }

}