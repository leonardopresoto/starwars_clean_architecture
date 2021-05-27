import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/network/network_info.dart';
import 'package:starwars_clean_architecture/features/people/data/datasources/people_local_datasource.dart';
import 'package:starwars_clean_architecture/features/people/data/datasources/people_remote_datasource.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';
import 'package:starwars_clean_architecture/features/people/domain/repositories/people_repository.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  final PeopleRemoteDataSource peopleRemoteDataSource;
  final PeopleLocalDataSource peopleLocalDataSource;
  final NetworkInfo networkInfo;

  PeopleRepositoryImpl({
    @required this.peopleRemoteDataSource,
    @required this.peopleLocalDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Person>>> getPeople(int pageNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteListOfPeople =
            await peopleRemoteDataSource.getPeople(pageNumber);
        //peopleLocalDataSource.cacheListOfPeople(remoteListOfPeople);
        return Right(remoteListOfPeople);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localListOfPeople = await peopleLocalDataSource.getListOfPeople();
        // return Right(localListOfPeople);
        return Left(CacheFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
