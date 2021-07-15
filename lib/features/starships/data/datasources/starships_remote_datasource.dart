import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:starwars_clean_architecture/core/config/app_config.dart';
import 'package:starwars_clean_architecture/core/config/http_routes.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/features/starships/data/models/starships_model.dart';

abstract class StarshipsRemoteDataSource {
  /// Calls the "http://swapi.dev/api/starships/?page={number}", endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<StarshipModel>> getStarships(int pageNumber);
}

class StarshipsRemoteDataSourceImpl implements StarshipsRemoteDataSource {
  final http.Client? client;

  StarshipsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<StarshipModel>> getStarships(int pageNumber) async {
    List<StarshipModel> result = [];
    Map<String, dynamic>? jsonMap;
    Response response;

    response = await client!
        .get(Uri.parse("${AppConfig.urlApi}/${HttpRoutes.GET_List_of_Starships}$pageNumber"));

    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
      for (var starship in jsonMap!['results']) {
        result.add(StarshipModel.fromJson(starship));
      }
      do {
        response = await client!
            .get(Uri.parse(jsonMap!['next']));
        if (response.statusCode == 200) {
          jsonMap = json.decode(response.body);
          for (var starship in jsonMap!['results']) {
            result.add(StarshipModel.fromJson(starship));
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
