import 'package:dartz/dartz.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/species/domain/entities/specie.dart';

abstract class SpeciesRepository {
  Future<Either<Failure, List<Specie>>> getSpecies(int pageNumber);
}
