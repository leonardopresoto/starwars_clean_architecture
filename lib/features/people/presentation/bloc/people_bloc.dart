import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';
import 'package:starwars_clean_architecture/features/people/domain/usecases/get_people.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  final GetPeople getPeople;

  PeopleBloc({
    required GetPeople people,
  })  : assert(people != null),
        getPeople = people,
        super(Empty());

  PeopleState get initialState => Empty();

  @override
  Stream<PeopleState> mapEventToState(
    PeopleEvent event,
  ) async* {
    if (event is GetPeopleBlocEvent) {
      yield Loading();
      final failureOrPeople = await getPeople(Params(number: 1));
      yield* _eitherLoadedOrErrorState(failureOrPeople);
    }
  }

  Stream<PeopleState> _eitherLoadedOrErrorState(
    Either<Failure, List<Person>> failureOrPeople,
  ) async* {
    yield failureOrPeople.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (listOfPeople) => Loaded(listOfPeople: listOfPeople),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
