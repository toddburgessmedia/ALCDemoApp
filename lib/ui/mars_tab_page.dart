
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/model/planet.dart';

class MarsTabPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final marsCubit = BlocProvider.of<MarsCubit>(context);
    marsCubit.getMars();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: BlocBuilder<MarsCubit,PlanetState>(
        builder: (context,state) {
          if (state is PlanetInitial) {
            print('state is initial');
            return Text("Initial");
          } else if (state is PlanetLoaded) {
            return MarsTabePageDisplay(state.planet);
          } else {
            return Text('unaccounted for state');
          }
        },
      ),
    );
  }
}

class MarsTabePageDisplay extends StatefulWidget {

  final Planet planet;

  MarsTabePageDisplay(this.planet);

  @override
  _MarsTabePageDisplayState createState() => _MarsTabePageDisplayState();
}

class _MarsTabePageDisplayState extends State<MarsTabePageDisplay> {

  bool metric = true;
  String? _randomFact;

  List<bool> _selections = [true,false];


  @override
  void initState() {
    _randomFact = _getRandomFact();
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
              setState(() {
                for (int i = 0; i < _selections.length; i++) {
                  _selections[i] = i == index;
                }
              });
            },
          //
          )

        ],
      ),
    );
  }
}