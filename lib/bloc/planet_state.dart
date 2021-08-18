
part of 'mars_cubit.dart';


abstract class PlanetState {
  const PlanetState();
}

class PlanetInitial extends PlanetState {
  const PlanetInitial();
}

class PlanetLoading extends PlanetState {
  const PlanetLoading();
}

class PlanetLoaded extends PlanetState {

  final Planet planet;
  const PlanetLoaded(this.planet);

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is PlanetLoaded && o.planet == planet;
  }

  @override
  int get hashCode => planet.hashCode;

}

class AllPlanetsLoaded extends PlanetState {

  Planets planets;
  AllPlanetsLoaded(this.planets);

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is PlanetLoaded && o.planet == planets;
  }

  @override
  int get hashCode => planets.hashCode;

}

class PlanetsFiltered extends PlanetState {
  Planets planets;
  PlanetsFiltered(this.planets);

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is PlanetsFiltered && o.planets == planets;
  }

  @override
  int get hashCode => planets.hashCode;



}



class PlanetError extends PlanetState {

  final String error;
  const PlanetError(this.error);

  @override
  bool operator ==(Object o) {
    if(identical(this,o)) return true;

    return o is PlanetError && o.error == error;
  }

  @override
  int get hashCode => error.hashCode;

}