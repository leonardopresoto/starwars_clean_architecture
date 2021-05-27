import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/people/data/models/people_model.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';
import 'package:starwars_clean_architecture/features/people/domain/usecases/get_people.dart';
import 'package:starwars_clean_architecture/features/people/presentation/bloc/bloc.dart';

import '../../../fixtures/fixture_reader.dart';

class MockGetPeople extends Mock
    implements GetPeople {}


void main() {
  PeopleBloc bloc;
  MockGetPeople mockGetPeople;

  setUp(() {
    mockGetPeople = MockGetPeople();

    bloc = PeopleBloc(
        people: mockGetPeople
    );
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(Empty()));
  });

  group('GetPeople', () {
    final tNumberParsed = 1;
    List<PersonModel> listOfPeopleModel = [];
    final Map<String, dynamic> jsonMap = json.decode(fixture('people.json'));
    for (var person in jsonMap['results']) {
      listOfPeopleModel.add(PersonModel.fromJson(person));
    }
    List<Person> listOfPeople = listOfPeopleModel;


    test(
      'should get data from the concrete use case',
          () async {
        // arrange
        when(mockGetPeople(any))
            .thenAnswer((_) async => Right(listOfPeople));
        // act
        bloc.add(GetPeopleBlocEvent(tNumberParsed));
        await untilCalled(mockGetPeople(any));
        // assert
        verify(mockGetPeople(Params(number: tNumberParsed)));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
          () async {
        // arrange
        when(mockGetPeople(any))
            .thenAnswer((_) async => Right(listOfPeople));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Loaded(listOfPeople: listOfPeople),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetPeopleBlocEvent(tNumberParsed));
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
          () async {
        // arrange
        when(mockGetPeople(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetPeopleBlocEvent(tNumberParsed));
      },
    );

    test(
      'should emit [Loading, Error] with a proper message for the error when getting data fails',
          () async {
        // arrange
        when(mockGetPeople(any))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetPeopleBlocEvent(tNumberParsed));
      },
    );
  });

}