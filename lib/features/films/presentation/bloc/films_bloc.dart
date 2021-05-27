import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/films/domain/entities/film.dart';
import 'package:starwars_clean_architecture/features/films/domain/usecases/get_films.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final GetFilms getFilms;

  FilmsBloc({
    @required GetFilms films,
  })  : assert(films != null),
        getFilms = films,
        super(Empty());

  FilmsState get initialState => Empty();

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    if (event is GetFilmsBlocEvent) {
      yield Loading();
      final failureOrFilms = await getFilms(Params(number: 1));
      yield* _eitherLoadedOrErrorState(failureOrFilms);
    }
  }

  Stream<FilmsState> _eitherLoadedOrErrorState(
    Either<Failure, List<Film>> failureOrFilms,
  ) async* {
    yield failureOrFilms.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (listOfFilms) => Loaded(listOfFilms: listOfFilms),
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
