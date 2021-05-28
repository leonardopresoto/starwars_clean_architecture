import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';
import 'package:starwars_clean_architecture/features/planets/domain/usecases/get_planets.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class PlanetsBloc extends Bloc<PlanetsEvent, PlanetsState> {
  final GetPlanets getPlanets;

  PlanetsBloc({
    required GetPlanets planets,
  })  : assert(planets != null),
        getPlanets = planets,
        super(Empty());

  PlanetsState get initialState => Empty();

  @override
  Stream<PlanetsState> mapEventToState(
    PlanetsEvent event,
  ) async* {
    if (event is GetPlanetsBlocEvent) {
      yield Loading();
      final failureOrPlanets = await getPlanets(Params(number: 1));
      yield* _eitherLoadedOrErrorState(failureOrPlanets);
    }
  }

  Stream<PlanetsState> _eitherLoadedOrErrorState(
    Either<Failure, List<Planet>> failureOrPlanets,
  ) async* {
    yield failureOrPlanets.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (listOfPlanets) => Loaded(listOfPlanets: listOfPlanets),
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
