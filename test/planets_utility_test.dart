
import 'dart:ffi';

import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mars_flutter/model/planets.dart';
import 'package:mars_flutter/model/planets_utility.dart';
import 'package:mars_flutter/repository/mars_repository.dart';

void main () async  {

  MarsRepository repo = MarsRepository();
  Planets testData = await repo.getPlanets();

  test ('2 planets should be found in utility', ()
  {
    final testCase = PlanetsUtility.filterByRadius(testData.planets, 500);
    expect(testCase.length, 2);
  });

  test ('Mars should be the furthest away', () async
  {
    final testCase = PlanetsUtility.sortDescending(testData.planets);
    expect(testCase[0].planetName,'Mars');
  });

}