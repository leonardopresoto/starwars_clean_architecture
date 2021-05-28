import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/usecases/usecases.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';
import 'package:starwars_clean_architecture/features/people/domain/repositories/people_repository.dart';

class GetPeople implements UseCase<List<Person>, Params> {
  final PeopleRepository? repository;

  GetPeople(this.repository);

  @override
  Future<Either<Failure, List<Person>>> call(Params params) async {
    if (params.number == null) {
      return Left(InvalidTextError());
    }
    return await repository!.getPeople(params.number);
  }
}

class Params {
  final int? number;

  Params({required this.number});

  List<Object?> get props => [number];
}
