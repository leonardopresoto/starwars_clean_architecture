import 'package:dartz/dartz.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/starships/domain/entities/starship.dart';


abstract class StarshipsRepository {
  Future<Either<Failure, List<Starship>>> getStarships(int pageNumber);
}
