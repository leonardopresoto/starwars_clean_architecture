import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/usecases/usecases.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';
import 'package:starwars_clean_architecture/features/planets/domain/repositories/planets_repository.dart';


class GetPlanets implements UseCase<List<Planet>, Params> {
  final PlanetsRepository? repository;

  GetPlanets(this.repository);

  @override
  Future<Either<Failure, List<Planet>>> call(Params params) async {
    if (params.number == null) {
      return Left(InvalidTextError());
    }
    return await repository!.getPlanets(params.number);
  }
}

class Params {
  final int number;

  Params({required this.number});

  List<Object> get props => [number];
}
