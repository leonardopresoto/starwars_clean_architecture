import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/network/network_info.dart';
import 'package:starwars_clean_architecture/features/planets/data/datasources/planets_local_datasource.dart';
import 'package:starwars_clean_architecture/features/planets/data/datasources/planets_remote_datasource.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';
import 'package:starwars_clean_architecture/features/planets/domain/repositories/planets_repository.dart';

class PlanetsRepositoryImpl implements PlanetsRepository {
  final PlanetsRemoteDataSource? planetsRemoteDataSource;
  final PlanetsLocalDataSource? planetsLocalDataSource;
  final NetworkInfo? networkInfo;

  PlanetsRepositoryImpl({
    required this.planetsRemoteDataSource,
    required this.planetsLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Planet>>> getPlanets(int pageNumber) async {
    if (await networkInfo!.isConnected) {
      try {
        final remoteListOfPlanets =
            await planetsRemoteDataSource!.getPlanets(pageNumber);
        //planetsLocalDataSource.cacheListOfPlanets(remoteListOfPlanets);
        return Right(remoteListOfPlanets);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localListOfPlanets = await planetsLocalDataSource.getListOfPlanets();
        // return Right(localListOfPlanets);
        return Left(CacheFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
