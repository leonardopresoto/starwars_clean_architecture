import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/usecases/usecases.dart';
import 'package:starwars_clean_architecture/features/species/domain/entities/specie.dart';
import 'package:starwars_clean_architecture/features/species/domain/repositories/species_repository.dart';

class GetSpecies implements UseCase<List<Specie>, Params> {
  final SpeciesRepository repository;

  GetSpecies(this.repository);

  @override
  Future<Either<Failure, List<Specie>>> call(Params params) async {
    if (params.number == null) {
      return Left(InvalidTextError());
    }
    return await repository.getSpecies(params.number);
  }
}

class Params {
  final int number;

  Params({@required this.number});

  List<Object> get props => [number];
}
