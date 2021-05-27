import 'package:dartz/dartz.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/entities/vehicle.dart';

abstract class VehiclesRepository {
  Future<Either<Failure, List<Vehicle>>> getVehicles(int pageNumber);
}
