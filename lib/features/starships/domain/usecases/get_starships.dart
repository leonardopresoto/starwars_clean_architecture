import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/usecases/usecases.dart';
import 'package:starwars_clean_architecture/features/starships/domain/entities/starship.dart';
import 'package:starwars_clean_architecture/features/starships/domain/repositories/starships_repository.dart';

class GetStarships implements UseCase<List<Starship>, Params> {
  final StarshipsRepository repository;

  GetStarships(this.repository);

  @override
  Future<Either<Failure, List<Starship>>> call(Params params) async {
    if (params.number == null) {
      return Left(InvalidTextError());
    }
    return await repository.getStarships(params.number);
  }
}

class Params {
  final int number;

  Params({@required this.number});

  List<Object> get props => [number];
}
