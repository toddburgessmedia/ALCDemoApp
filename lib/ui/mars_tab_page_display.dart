
import 'package:flutter/material.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/ui/planet_display.dart';

class MarsTabPageDisplay extends StatelessWidget {

  final Planet planet;

  MarsTabPageDisplay(this.planet) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column (
        children: <Widget>[
          PlanetDisplay(planet: planet)
        ],
      ),
    );
  }
}