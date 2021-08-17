
// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/bloc/planet_bloc.dart';
import 'package:mars_flutter/bloc/planet_event.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/model/planets.dart';
import 'package:mars_flutter/repository/dummy_data.dart';
import 'package:mars_flutter/ui/planet_display.dart';

class PlanetsTabPage extends StatefulWidget {


  @override
  _PlanetsTabPageState createState() => _PlanetsTabPageState();
}

class _PlanetsTabPageState extends State<PlanetsTabPage> {

  @override
  Widget build(BuildContext context) {
    final planetBloc = BlocProvider.of<PlanetBloc>(context);
    planetBloc.add(GetPlanets());
    return Container(
      child: BlocBuilder<PlanetBloc,PlanetState>(
            builder: (context,state) {
              if (state is AllPlanetsLoaded) {
                 return PlanetsTabsPageDisplay(state.planets);
              } else {
                return Text("invalid state");
              }
            },
      ), 
      
    );
  }
}

class PlanetsTabsPageDisplay extends StatefulWidget {
  
  Planets planets;
  
  PlanetsTabsPageDisplay(this.planets) : super();
  
  @override
  _PlanetsTabsPageDisplayState createState() => _PlanetsTabsPageDisplayState();
}

class _PlanetsTabsPageDisplayState extends State<PlanetsTabsPageDisplay> {

  double opacity = 1.0;
  String _todayDate = "";

  @override
  void initState() {
    super.initState();
    _todayDate = _formatDate();
    _changeOpacity();
  }

  _changeOpacity() {
    Future.delayed(Duration(seconds: 1), () {
      if (this.mounted) {
        setState(() {
          opacity = opacity == 0.0 ? 1.0 : 0.0;
          _changeOpacity();
        });
      }
    });
  }

  String _formatDate() {
    final df = DateFormat('MMMM d, y','en_US');
    return df.format(DateTime.now());

  }

  @override
  Widget build(BuildContext context) {
    List<Planet> thePlanets = widget.planets.planets;
    return Container(
      child: ListView(
        children: [
          AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 1000),
            child: Center(child: Text(_todayDate)),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: thePlanets.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: [
                      PlanetDisplay(planet: thePlanets[index])
                    ],
                  ),

                );
              }
          )
        ],
      ),
    );
  }
}


