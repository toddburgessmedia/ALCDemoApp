// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/bloc/planet_bloc.dart';
import 'package:mars_flutter/bloc/planet_event.dart';
import 'package:mars_flutter/ui/planets/planets_tabs_page_display.dart';

class PlanetsTabPage extends StatefulWidget {
  @override
  _PlanetsTabPageState createState() => _PlanetsTabPageState();
}


class _PlanetsTabPageState extends State<PlanetsTabPage> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: BlocBuilder<PlanetBloc, PlanetState>(
          builder: (context, state) {
            if (state is PlanetLoading) {
              return Text("Loading Planets....");
            } else if (state is AllPlanetsLoaded) {
              return PlanetsTabsPageDisplay(planets: state.planets);
            } else if (state is PlanetsFiltered) {
              return PlanetsTabsPageDisplay(planets: state.planets);
            } else {
              return Text("invalid state");
            }
          },
        ),
      );
  }

  @override
  void initState() {
    super.initState();
    final planetBloc = BlocProvider.of<PlanetBloc>(context);
    planetBloc.add(GetPlanets());
  }
}