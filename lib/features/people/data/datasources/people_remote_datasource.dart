import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/features/people/data/models/people_model.dart';

abstract class PeopleRemoteDataSource {
  /// Calls the "http://swapi.dev/api/people/?page={number}", endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PersonModel>> getPeople(int? pageNumber);
}

class PeopleRemoteDataSourceImpl implements PeopleRemoteDataSource {
  final http.Client? client;

  PeopleRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PersonModel>> getPeople(int? pageNumber) async {
    List<PersonModel> result = [];
    Map<String, dynamic>? jsonMap;
    Response response;

    response = await client!
        .get(Uri.parse("http://swapi.dev/api/people/?page=$pageNumber"));

    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
      for (var person in jsonMap!['results']) {
        result.add(PersonModel.fromJson(person));
      }
      do {
        response = await client!
            .get(Uri.parse(jsonMap!['next']));
        if (response.statusCode == 200) {
          jsonMap = json.decode(response.body);
          for (var person in jsonMap!['results']) {
            result.add(PersonModel.fromJson(person));
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
