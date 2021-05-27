import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/usecases/usecases.dart';
import 'package:starwars_clean_architecture/features/films/domain/entities/film.dart';
import 'package:starwars_clean_architecture/features/films/domain/repositories/films_repository.dart';

class GetFilms implements UseCase<List<Film>, Params> {
  final FilmsRepository repository;

  GetFilms(this.repository);

  @override
  Future<Either<Failure, List<Film>>> call(Params params) async {
    if (params.number == null) {
      return Left(InvalidTextError());
    }
    return await repository.getFilms(params.number);
  }
}

class Params {
  final int number;

  Params({@required this.number});

  List<Object> get props => [number];
}
