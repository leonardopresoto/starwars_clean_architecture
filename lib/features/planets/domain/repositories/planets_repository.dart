import 'package:dartz/dartz.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';


abstract class PlanetsRepository {
  Future<Either<Failure, List<Planet>>> getPlanets(int pageNumber);
}
