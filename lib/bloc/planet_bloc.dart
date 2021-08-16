
import 'package:bloc/bloc.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/bloc/planet_event.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:flutter/material.dart';
import 'package:mars_flutter/repository/mars_repository.dart';

class PlanetBloc extends Bloc<PlanetEvent,PlanetState> {

  final MarsRepository _planetRepository;

  PlanetBloc(this._planetRepository) : super(PlanetInitial());

  @override
  Stream<PlanetState> mapEventToState(PlanetEvent event) async* {

    if (event is GetMars) {
      try {
        emit(PlanetLoading());
        final mars = await _planetRepository.getMars();
        emit(PlanetLoaded(mars));
      } on Exception {
        emit(PlanetError("Unable to load Mars"));
      }
    }
    try {
      if (event is GetPlanets) {
        emit(PlanetLoading());
        final planets = await _planetRepository.getPlanets();
        emit(AllPlanetsLoaded(planets));
      }
    } on Exception {
      emit(PlanetError("Unable to load the planets"));
    }
  }
}
