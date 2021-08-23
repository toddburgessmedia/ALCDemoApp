
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_flutter/bloc/planet_bloc.dart';
import 'package:mars_flutter/repository/mars_repository.dart';
import 'package:mars_flutter/ui/alc_tab_page.dart';
import 'package:mars_flutter/ui/mars_tab_page.dart';
import 'package:mars_flutter/ui/planets_tab_page.dart';

class ALCHomePage extends StatefulWidget {

  ALCHomePage({Key? key}) : super(key: key);

  @override
  _ALCHomePageState createState() => _ALCHomePageState();
}

class _ALCHomePageState extends State<ALCHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ALC Test App'),
          bottom: TabBar(
            tabs: [
              Text('Mars'),
              Text('Planets'),
              Text('Web')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) => PlanetBloc(MarsRepository()),
              child: MarsTabPage(),
            ),
            BlocProvider(
              create: (context) => PlanetBloc(MarsRepository()),
              child: PlanetsTabPage(),
            ),
            ALCTabPage()
          ],
        ),
    );
  }
}