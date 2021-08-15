
import 'package:bloc/bloc.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/repository/mars_repository.dart';

part 'planet_state.dart';

class MarsCubit extends Cubit<PlanetState> {

  final MarsRepository _marsRepo;

  MarsCubit(this._marsRepo) : super (PlanetInitial());

  Future<void> getMars() async {
    try {
      emit(PlanetLoading());
      final mars = await _marsRepo.getMars();
      emit(PlanetLoaded(mars));
    } on Exception {
      emit(PlanetError("Unable to load the weather"));
    }
  }
}