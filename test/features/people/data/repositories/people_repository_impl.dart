import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/network/network_info.dart';
import 'package:starwars_clean_architecture/features/people/data/datasources/people_local_datasource.dart';
import 'package:starwars_clean_architecture/features/people/data/datasources/people_remote_datasource.dart';
import 'package:starwars_clean_architecture/features/people/data/models/people_model.dart';
import 'package:starwars_clean_architecture/features/people/data/repositories/people_repository_impl.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockPeopleRemoteDataSource extends Mock
    implements PeopleRemoteDataSource {}

class MockPeopleLocalDataSource extends Mock implements PeopleLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late PeopleRepositoryImpl repository;
  MockPeopleRemoteDataSource? mockPeopleRemoteDataSource;
  MockPeopleLocalDataSource? mockPeopleLocalDataSource;
  MockNetworkInfo? mockNetworkInfo;

  setUp(() {
    mockPeopleRemoteDataSource = MockPeopleRemoteDataSource();
    mockPeopleLocalDataSource = MockPeopleLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = PeopleRepositoryImpl(
        peopleRemoteDataSource: mockPeopleRemoteDataSource,
        peopleLocalDataSource: mockPeopleLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      // This setUp applies only to the 'device is online' group
      setUp(() {
        when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      // This setUp applies only to the 'device is offline' group
      setUp(() {
        when(mockNetworkInfo!.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group(
    "getPeople -  method to get all characters from STARWARS API",
    () {
      final pageNumber = 1;
      List<PersonModel> listOfPeopleModel = [];
      final Map<String, dynamic> jsonMap = json.decode(fixture('people.json'));
      for (var person in jsonMap['results']) {
        listOfPeopleModel.add(PersonModel.fromJson(person));
      }
      List<Person> listOfPeople = listOfPeopleModel;

      test(
        "should test if the device is online",
        () async {
          when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);
          repository.getPeople(pageNumber);
          verify(mockNetworkInfo!.isConnected);
        },
      );
      runTestsOnline(
        () {
          test(
            'should return remote data when the call to remote data is successful',
            () async {
              // arrange
              when(mockPeopleRemoteDataSource!.getPeople(any))
                  .thenAnswer((_) async => listOfPeopleModel);
              // act
              final result = await repository.getPeople(pageNumber);
              // assert
              verify(mockPeopleRemoteDataSource!.getPeople(pageNumber));
              expect(result, equals(Right(listOfPeople)));
            },
          );

          test(
            'should cache the data locally when the call to remote data is successful',
            () async {
              // arrange
              when(mockPeopleRemoteDataSource!.getPeople(any))
                  .thenAnswer((_) async => listOfPeopleModel);
              // act
              await repository.getPeople(pageNumber);
              // assert
              verify(mockPeopleRemoteDataSource!.getPeople(pageNumber));
              verify(mockPeopleLocalDataSource!
                  .cacheListOfPeople(listOfPeopleModel));
            },
          );

          test(
            'should return SERVER FAILURE when the call to remote data is UNsuccessful',
            () async {
              // arrange
              when(mockPeopleRemoteDataSource!.getPeople(any))
                  .thenThrow(ServerException());
              // act
              final result = await repository.getPeople(pageNumber);
              // assert
              verify(mockPeopleRemoteDataSource!.getPeople(pageNumber));
              verifyZeroInteractions(mockPeopleLocalDataSource);
              expect(result.isLeft(), true);
              expect(result.fold(id, id), isA<ServerFailure>());
            },
          );
        },
      );
      runTestsOffline(
        () {
          test(
            'should return local data when the local data is available in the local database',
            () async {
              // arrange
              when(mockPeopleLocalDataSource!.getListOfPeople())
                  .thenAnswer((_) async => listOfPeopleModel);
              // act
              final result = await repository.getPeople(pageNumber);
              // assert
              verifyZeroInteractions(mockPeopleRemoteDataSource);
              verify(mockPeopleLocalDataSource!.getListOfPeople());
              expect(result, equals(Right(listOfPeople)));
            },
          );

          test(
            'should return CACHE FAILURE data when the local data is NOT available in the local database',
            () async {
              // arrange
              when(mockPeopleLocalDataSource!.getListOfPeople())
                  .thenThrow(CacheException());
              // act
              final result = await repository.getPeople(pageNumber);
              // assert
              verifyZeroInteractions(mockPeopleRemoteDataSource);
              verify(mockPeopleLocalDataSource!.getListOfPeople());
              expect(result.isLeft(), true);
              expect(result.fold(id, id), isA<CacheFailure>());
            },
          );
        },
      );
    },
  );
}
