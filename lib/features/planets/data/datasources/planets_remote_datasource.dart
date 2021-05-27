import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/features/planets/data/models/planets_model.dart';

abstract class PlanetsRemoteDataSource {
  /// Calls the "http://swapi.dev/api/planets/?page={number}", endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PlanetModel>> getPlanets(int pageNumber);
}

class PlanetsRemoteDataSourceImpl implements PlanetsRemoteDataSource {
  final http.Client client;

  PlanetsRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<PlanetModel>> getPlanets(int pageNumber) async {
    List<PlanetModel> result = [];
    Map<String, dynamic> jsonMap;
    Response response;

    response = await client
        .get(Uri.parse("http://swapi.dev/api/planets/?page=$pageNumber"));

    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
      for (var planet in jsonMap['results']) {
        result.add(PlanetModel.fromJson(planet));
      }
      do {
        response = await client
            .get(Uri.parse(jsonMap['next']));
        if (response.statusCode == 200) {
          jsonMap = json.decode(response.body);
          for (var planet in jsonMap['results']) {
            result.add(PlanetModel.fromJson(planet));
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
