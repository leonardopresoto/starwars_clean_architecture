import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/features/vehicles/data/models/vehicles_model.dart';

abstract class VehiclesRemoteDataSource {
  /// Calls the "http://swapi.dev/api/vehicles/?page={number}", endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<VehicleModel>> getVehicles(int pageNumber);
}

class VehiclesRemoteDataSourceImpl implements VehiclesRemoteDataSource {
  final http.Client? client;

  VehiclesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<VehicleModel>> getVehicles(int pageNumber) async {
    List<VehicleModel> result = [];
    Map<String, dynamic>? jsonMap;
    Response response;

    response = await client!
        .get(Uri.parse("http://swapi.dev/api/vehicles/?page=$pageNumber"));

    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
      for (var vehicle in jsonMap!['results']) {
        result.add(VehicleModel.fromJson(vehicle));
      }
      do {
        response = await client!
            .get(Uri.parse(jsonMap!['next']));
        if (response.statusCode == 200) {
          jsonMap = json.decode(response.body);
          for (var vehicle in jsonMap!['results']) {
            result.add(VehicleModel.fromJson(vehicle));
          }
        } else {
          throw ServerException();
        }
      } while (jsonMap['next'] != null);
      return result;
    } else {
      throw ServerException();
    }
  }
}
