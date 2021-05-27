import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/starships/domain/entities/starship.dart';
import 'package:starwars_clean_architecture/features/starships/domain/usecases/get_starships.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class StarshipsBloc extends Bloc<StarshipsEvent, StarshipsState> {
  final GetStarships getStarships;

  StarshipsBloc({
    @required GetStarships starships,
  })  : assert(starships != null),
        getStarships = starships,
        super(Empty());

  StarshipsState get initialState => Empty();

  @override
  Stream<StarshipsState> mapEventToState(
    StarshipsEvent event,
  ) async* {
    if (event is GetStarshipsBlocEvent) {
      yield Loading();
      final failureOrStarships = await getStarships(Params(number: 1));
      yield* _eitherLoadedOrErrorState(failureOrStarships);
    }
  }

  Stream<StarshipsState> _eitherLoadedOrErrorState(
    Either<Failure, List<Starship>> failureOrStarships,
  ) async* {
    yield failureOrStarships.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (listOfStarships) => Loaded(listOfStarships: listOfStarships),
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
