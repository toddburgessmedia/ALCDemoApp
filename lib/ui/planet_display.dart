
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mars_flutter/model/planet.dart';

class PlanetDisplay extends StatefulWidget {

  final Planet planet;

  const PlanetDisplay({Key? key,required this.planet}) : super(key: key);

  @override
  _PlanetDisplayState createState() => _PlanetDisplayState();
}

class _PlanetDisplayState extends State<PlanetDisplay> {
  bool metric = true;
  String? _randomFact;

  List<bool> _selections = [true,false];


  @override
  void initState() {
    super.initState();
    _randomFact = _getRandomFact();
  }

  flipSelections(int index) {
    setState(() {
      for (int i = 0; i < _selections.length; i++) {
        _selections[i] = i == index;
      }
    });
  }

  String _getDistance() {
    final String metricText = 'kilometers';
    final String imperialText = 'miles';

    if (_selections[0]) {
      return "${widget.planet.planetName} distance to earth is ${widget.planet.extra.distanceToEarth}" + " $metricText";
    } else {
      return "${widget.planet.planetName} distance to sun is ${widget.planet.extra.distanceToSun}" + " $metricText";
    }
  }

  String _getRandomFact() {
    Random rnd = new Random();

    return "Fun fact " + widget.planet.extra.facts[rnd.nextInt(3)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column (
        children: <Widget>[
          Text(widget.planet.planetName, style: TextStyle(fontSize: 24),),
          Image.network(widget.planet.imageThumbnail),
          Text(_getDistance()),
          Text(_randomFact ?? "error"),
          ToggleButtons(
            children: [
              Text("Earth"),
              Text("Sun")
            ],
            isSelected: _selections,
            onPressed: (int index) {
              flipSelections(index);
            },
            //
          )

        ],
      ),
    );
  }
}
