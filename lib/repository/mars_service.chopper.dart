// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mars_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MarsService extends MarsService {
  _$MarsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MarsService;

  @override
  Future<Response<dynamic>> getMars() {
    final $url = 'https://neonfish.net/mars_api.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPlanets() {
    final $url = 'https://neonfish.net/mars_api.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
