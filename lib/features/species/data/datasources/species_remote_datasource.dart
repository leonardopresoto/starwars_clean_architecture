import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/features/species/data/models/species_model.dart';

abstract class SpeciesRemoteDataSource {
  /// Calls the "http://swapi.dev/api/species/?page={number}", endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<SpecieModel>> getSpecies(int pageNumber);
}

class SpeciesRemoteDataSourceImpl implements SpeciesRemoteDataSource {
  final http.Client? client;

  SpeciesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SpecieModel>> getSpecies(int pageNumber) async {
    List<SpecieModel> result = [];
    Map<String, dynamic>? jsonMap;
    Response response;

    response = await client!
        .get(Uri.parse("http://swapi.dev/api/species/?page=$pageNumber"));

    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
      for (var specie in jsonMap!['results']) {
        result.add(SpecieModel.fromJson(specie));
      }
      do {
        response = await client!
            .get(Uri.parse(jsonMap!['next']));
        if (response.statusCode == 200) {
          jsonMap = json.decode(response.body);
          for (var specie in jsonMap!['results']) {
            result.add(SpecieModel.fromJson(specie));
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
