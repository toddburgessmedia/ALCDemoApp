
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_flutter/bloc/planet_bloc.dart';
import 'package:mars_flutter/bloc/planet_event.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/model/planets.dart';
import 'package:mars_flutter/ui/planet_display.dart';
import 'package:mars_flutter/ui/planets/todays_display.dart';

import 'diameter_picker_dialog.dart';

class PlanetsTabsPageDisplay extends StatefulWidget {
  final Planets planets;

  PlanetsTabsPageDisplay({Key? key,required this.planets})  : super(key: key);

  @override
  _PlanetsTabsPageDisplayState createState() => _PlanetsTabsPageDisplayState();
}

class _PlanetsTabsPageDisplayState extends State<PlanetsTabsPageDisplay> {

  List<Planet> thePlanets = [];

  void _showAlertDialog() async {

    double? diameter = await showDialog<double>(
        context: context, builder: (context) => DiameterPickerDialog());

    final planetBloc = BlocProvider.of<PlanetBloc>(context);
    planetBloc.add(GetPlanetsFiltered(diameter!.toInt()));
  }

  void _resetList() {
    final planetBloc = BlocProvider.of<PlanetBloc>(context);
    planetBloc.add(GetPlanets());
  }

  @override
  Widget build(BuildContext context) {
    thePlanets = widget.planets.planets;
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      ElevatedButton(
                          onPressed: () => _showAlertDialog(),
                          child: Text('Filter by Planet Diameter')),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () => _resetList(),
                          child: Text('Reset List')),
                  ],
                ),
                TodaysDisplay(),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: thePlanets.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [PlanetDisplay(planet: thePlanets[index])],
                        ),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

