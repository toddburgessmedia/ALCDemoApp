
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/model/planet.dart';

class MarsTabPage extends StatelessWidget {

  final Planet? planet;
  MarsTabPage(this.planet);

  @override
  Widget build(BuildContext context) {
    final marsCubit = BlocProvider.of<MarsCubit>(context);
    marsCubit.getMars();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: BlocBuilder<MarsCubit,MarsState>(
        builder: (context,state) {
          if (state is MarsInitial) {
            print('state is initial');
            return Text("Initial");
          } else if (state is MarsLoaded) {
            return Text(state.planet.planetName);
          } else {
            print('lets do nothing');
            return Text('lets do nothing');
          }
        },
      ),
    );
  }
}

