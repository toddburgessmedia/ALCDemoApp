import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/bloc/planet_bloc.dart';
import 'package:mars_flutter/repository/mars_repository.dart';
import 'package:mars_flutter/ui/alc_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PlanetBloc(MarsRepository()),
        child: ALCHomePage(),
      )
      //,
    );
  }
}


