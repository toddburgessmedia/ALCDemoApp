
import 'package:flutter/foundation.dart';

@immutable
abstract class PlanetEvent {}

class GetMars extends PlanetEvent {

    GetMars();
}

class GetPlanets extends PlanetEvent {

    GetPlanets();
}

class GetPlanetsFiltered extends PlanetEvent {

    final int diameter;

    GetPlanetsFiltered(this.diameter);

}