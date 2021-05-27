import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/features/people/data/datasources/people_remote_datasource.dart';
import 'package:starwars_clean_architecture/features/people/data/models/people_model.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  PeopleRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PeopleRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response(fixture('people.json'), 200));
  }

  void setUpMockHttpClientException404() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getpeople', () {
    final numberPage = 1;
    List<PersonModel> listOfPersonModel = [];
    final Map<String, dynamic> jsonMap =
    json.decode(fixture('people.json'));
    for (var person in jsonMap['results']) {
      listOfPersonModel.add(PersonModel.fromJson(person));
    }

    test(
      'should preform a GET request on a URL with number being the endpoint',
      () async {
        //arrange
        setUpMockHttpClientSuccess200();
        // act
       dataSource.getPeople(numberPage);
        // assert
        verify(mockHttpClient.get(
          Uri.parse("http://swapi.dev/api/people/?page=$numberPage"),
        ));
      },
    );

    test(
      'should preform a GET request on a URL when numberPage = null, the result is the same as result =1',
          () async {
        //arrange
        final numberPagenull = null;
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getPeople(numberPagenull);
        // assert
        verify(mockHttpClient.get(
          Uri.parse("http://swapi.dev/api/people/?page=$numberPagenull"),
        ));
      },
    );

    test(
      'should return List of Person when the response code is 200 (success)',
          () async {
        // arrange
           setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getPeople(numberPage);
        // assert
        expect(result, listOfPersonModel);
        expect(result.length, listOfPersonModel.length);
        expect(result[0].name, listOfPersonModel[0].name);
      },
    );

    test(
      'should throw a ServerException when the response code is different of 200',
      () async {
        // arrange
        setUpMockHttpClientException404();
        // act
         final call = dataSource.getPeople(numberPage);
         // assert
         expect(() => call, throwsA(isA<ServerException>()));
       },
     );
  });
}
