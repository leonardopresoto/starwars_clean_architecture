import 'package:dartz/dartz.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/films/domain/entities/film.dart';


abstract class FilmsRepository {
  Future<Either<Failure, List<Film>>> getFilms(int pageNumber);
}
