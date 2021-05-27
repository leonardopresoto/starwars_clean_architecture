import 'package:dartz/dartz.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';

abstract class PeopleRepository {
  Future<Either<Failure, List<Person>>> getPeople(int pageNumber);
}
