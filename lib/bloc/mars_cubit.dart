
import 'package:bloc/bloc.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/repository/mars_repository.dart';

part 'mars_state.dart';

class MarsCubit extends Cubit<MarsState> {

  final MarsRepository _marsRepo;

  MarsCubit(this._marsRepo) : super (MarsInitial());

  Future<void> getMars() async {
    try {
      emit(MarsLoading());
      final mars = await _marsRepo.getMars();
      emit(MarsLoaded(mars));
    } on Exception {
      emit(MarsError("Unable to load the weather"));
    }
  }
}