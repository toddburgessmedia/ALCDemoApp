
import 'package:mars_flutter/model/planet.dart';

class PlanetsUtility {

  static List<Planet> filterByRadius(List<Planet> target,int radius) {

    return target.where((element) => element.diameter > radius).toList();
  }

  static List<Planet> sortDescending(List<Planet> target) {

    target.sort((a,b) {
      return a.diameter.compareTo(b.diameter);
    });

    return target;
  }

  static double getLargestRadius(List<Planet> target) {

    return target.reduce((a, b) => a.diameter > b.diameter? a: b).diameter.toDouble();
  }
}