import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:starwars_clean_architecture/core/config/app_config.dart';
import 'package:starwars_clean_architecture/core/config/http_routes.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/features/films/data/models/films_model.dart';

abstract class FilmsRemoteDataSource {
  /// Calls the "http://swapi.dev/api/films/?page={number}", endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<FilmModel>> getFilms(int pageNumber);
}

class FilmsRemoteDataSourceImpl implements FilmsRemoteDataSource {
  final http.Client? client;

  FilmsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<FilmModel>> getFilms(int pageNumber) async {
    List<FilmModel> result = [];
    Map<String, dynamic>? jsonMap;
    Response response;

    response = await client!
        .get(Uri.parse("${AppConfig.urlApi}/${HttpRoutes.GET_List_of_Films}$pageNumber"));

    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
      for (var film in jsonMap!['results']) {
        result.add(FilmModel.fromJson(film));
      }
      return result;
    } else {
      throw ServerException();
    }
  }
}
