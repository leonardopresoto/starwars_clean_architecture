import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/network/network_info.dart';
import 'package:starwars_clean_architecture/features/films/data/datasources/films_local_datasource.dart';
import 'package:starwars_clean_architecture/features/films/data/datasources/films_remote_datasource.dart';
import 'package:starwars_clean_architecture/features/films/domain/entities/film.dart';
import 'package:starwars_clean_architecture/features/films/domain/repositories/films_repository.dart';

class FilmsRepositoryImpl implements FilmsRepository {
  final FilmsRemoteDataSource filmsRemoteDataSource;
  final FilmsLocalDataSource filmsLocalDataSource;
  final NetworkInfo networkInfo;

  FilmsRepositoryImpl({
    @required this.filmsRemoteDataSource,
    @required this.filmsLocalDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Film>>> getFilms(int pageNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteListOfFilms =
            await filmsRemoteDataSource.getFilms(pageNumber);
        //filmsLocalDataSource.cacheListOfFilms(remoteListOfFilms);
        return Right(remoteListOfFilms);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localListOfFilms = await filmsLocalDataSource.getListOfFilms();
        // return Right(localListOfFilms);
        return Left(CacheFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
