import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/species/domain/entities/specie.dart';
import 'package:starwars_clean_architecture/features/species/domain/usecases/get_species.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class SpeciesBloc extends Bloc<SpeciesEvent, SpeciesState> {
  final GetSpecies getSpecies;

  SpeciesBloc({
    required GetSpecies species,
  })  : assert(species != null),
        getSpecies = species,
        super(Empty());

  SpeciesState get initialState => Empty();

  @override
  Stream<SpeciesState> mapEventToState(
    SpeciesEvent event,
  ) async* {
    if (event is GetSpeciesBlocEvent) {
      yield Loading();
      final failureOrSpecies = await getSpecies(Params(number: 1));
      yield* _eitherLoadedOrErrorState(failureOrSpecies);
    }
  }

  Stream<SpeciesState> _eitherLoadedOrErrorState(
    Either<Failure, List<Specie>> failureOrSpecies,
  ) async* {
    yield failureOrSpecies.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (listOfSpecies) => Loaded(listOfSpecies: listOfSpecies),
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
