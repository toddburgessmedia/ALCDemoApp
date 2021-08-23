import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/bloc/planet_bloc.dart';
import 'package:mars_flutter/bloc/planet_event.dart';
import 'package:mars_flutter/ui/planets/planets_tabs_page_display.dart';

class PlanetsTabPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final planetBloc = BlocProvider.of<PlanetBloc>(context);
    planetBloc.add(GetPlanets());
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [BlocBuilder<PlanetBloc, PlanetState>(
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
        )],
    );
  }

}