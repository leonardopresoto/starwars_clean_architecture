import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/network/network_info.dart';
import 'package:starwars_clean_architecture/features/starships/data/datasources/starships_local_datasource.dart';
import 'package:starwars_clean_architecture/features/starships/data/datasources/starships_remote_datasource.dart';
import 'package:starwars_clean_architecture/features/starships/domain/entities/starship.dart';
import 'package:starwars_clean_architecture/features/starships/domain/repositories/starships_repository.dart';

class StarshipsRepositoryImpl implements StarshipsRepository {
  final StarshipsRemoteDataSource starshipsRemoteDataSource;
  final StarshipsLocalDataSource starshipsLocalDataSource;
  final NetworkInfo networkInfo;

  StarshipsRepositoryImpl({
    @required this.starshipsRemoteDataSource,
    @required this.starshipsLocalDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Starship>>> getStarships(int pageNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteListOfStarships =
            await starshipsRemoteDataSource.getStarships(pageNumber);
        //starshipsLocalDataSource.cacheListOfStarships(remoteListOfStarships);
        return Right(remoteListOfStarships);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localListOfStarships = await starshipsLocalDataSource.getListOfStarships();
        // return Right(localListOfStarships);
        return Left(CacheFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
