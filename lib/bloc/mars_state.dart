
part of 'mars_cubit.dart';


abstract class MarsState {
  const MarsState();
}

class MarsInitial extends MarsState {
  const MarsInitial();
}

class MarsLoading extends MarsState {
  const MarsLoading();
}

class MarsLoaded extends MarsState {

  final Planet planet;
  const MarsLoaded(this.planet);

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is MarsLoaded && o.planet == planet;
  }

  @override
  int get hashCode => planet.hashCode;

}

class MarsError extends MarsState {

  final String error;
  const MarsError(this.error);

  @override
  bool operator ==(Object o) {
    if(identical(this,o)) return true;

    return o is MarsError && o.error == error;
  }

  @override
  int get hashCode => error.hashCode;

}