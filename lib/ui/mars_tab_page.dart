
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/bloc/planet_bloc.dart';
import 'package:mars_flutter/bloc/planet_event.dart';
import 'package:mars_flutter/model/planet.dart';

import 'mars_tab_page_display.dart';

class MarsTabPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // final marsCubit = BlocProvider.of<MarsCubit>(context);
    // marsCubit.getMars();
    final planetBloc = BlocProvider.of<PlanetBloc>(context);
    planetBloc.add(GetMars());
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: BlocBuilder<PlanetBloc,PlanetState>(
        builder: (context,state) {
          if (state is PlanetInitial) {
            return Text("Initial");
          } else if (state is PlanetLoaded) {
            return MarsTabPageDisplay(state.planet);
          } else {
            return Text('unaccounted for state');
          }
        },
      ),
    );
  }
}

