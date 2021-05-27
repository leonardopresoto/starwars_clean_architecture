import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/network/network_info.dart';
import 'package:starwars_clean_architecture/features/species/data/datasources/species_local_datasource.dart';
import 'package:starwars_clean_architecture/features/species/data/datasources/species_remote_datasource.dart';
import 'package:starwars_clean_architecture/features/species/domain/entities/specie.dart';
import 'package:starwars_clean_architecture/features/species/domain/repositories/species_repository.dart';

class SpeciesRepositoryImpl implements SpeciesRepository {
  final SpeciesRemoteDataSource speciesRemoteDataSource;
  final SpeciesLocalDataSource speciesLocalDataSource;
  final NetworkInfo networkInfo;

  SpeciesRepositoryImpl({
    @required this.speciesRemoteDataSource,
    @required this.speciesLocalDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Specie>>> getSpecies(int pageNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteListOfSpecies =
            await speciesRemoteDataSource.getSpecies(pageNumber);
        //speciesLocalDataSource.cacheListOfSpecies(remoteListOfSpecies);
        return Right(remoteListOfSpecies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localListOfSpecies = await speciesLocalDataSource.getListOfSpecies();
        // return Right(localListOfSpecies);
        return Left(CacheFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
