import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/usecases/usecases.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/entities/vehicle.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/repositories/vehicles_repository.dart';

class GetVehicles implements UseCase<List<Vehicle>, Params> {
  final VehiclesRepository repository;

  GetVehicles(this.repository);

  @override
  Future<Either<Failure, List<Vehicle>>> call(Params params) async {
    if (params.number == null) {
      return Left(InvalidTextError());
    }
    return await repository.getVehicles(params.number);
  }
}

class Params {
  final int number;

  Params({@required this.number});

  List<Object> get props => [number];
}
