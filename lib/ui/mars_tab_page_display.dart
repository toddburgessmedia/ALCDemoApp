
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/ui/planet_display.dart';

class MarsTabPageDisplay extends StatefulWidget {

  final Planet planet;

  MarsTabPageDisplay(this.planet) : super();

  @override
  _MarsTabPageDisplayState createState() => _MarsTabPageDisplayState();
}

class _MarsTabPageDisplayState extends State<MarsTabPageDisplay> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column (
        children: <Widget>[
          PlanetDisplay(planet: widget.planet)
        ],
      ),
    );
  }
}