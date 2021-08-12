
import 'dart:async';
import 'package:chopper/chopper.dart';

part 'mars_service.chopper.dart';

@ChopperApi(baseUrl: 'https://neonfish.net')
abstract class MarsService extends ChopperService {

  static MarsService create([ChopperClient? client]) => _$MarsService(client);

  @Get(path: '/mars_api.json')
  Future<Response> getMars();

}


