
import 'package:bloc/bloc.dart';
import 'package:mars_flutter/bloc/mars_cubit.dart';
import 'package:mars_flutter/bloc/planet_event.dart';
import 'package:mars_flutter/model/planets.dart';
import 'package:mars_flutter/model/planets_utility.dart';
import 'package:mars_flutter/repository/mars_repository.dart';

class PlanetBloc extends Bloc<PlanetEvent,PlanetState> {

  final MarsRepository _planetRepository;

  PlanetBloc(this._planetRepository) : super(PlanetInitial());

  @override
  Stream<PlanetState> mapEventToState(PlanetEvent event) async* {

    if (event is GetMars) {
      try {
        yield PlanetLoading();
        final mars = await _planetRepository.getMars();
        yield PlanetLoaded(mars);
      } on Exception {
        yield PlanetError("Unable to load Mars");
      }
    }
    if (event is GetPlanets) {
      yield PlanetLoading();
      final planets = await _planetRepository.getPlanets();
      yield AllPlanetsLoaded(planets);
    }
    try {
    } on Exception {
      yield PlanetError("Unable to load the planets");
    }

    if (event is GetPlanetsFiltered) {
      try {
        print('filtered!! ${event.diameter}');
        yield PlanetLoading();
        final planets = await _planetRepository.getPlanets();
        final planetsFiltered = Planets(PlanetsUtility.filterByRadius(planets.planets, event.diameter));
        yield PlanetsFiltered(planetsFiltered);
      } on Exception {
          yield PlanetError('unable to load planets');
      }
    }
  }
}
