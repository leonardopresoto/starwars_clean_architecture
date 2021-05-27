import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/exceptions.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/core/network/network_info.dart';
import 'package:starwars_clean_architecture/features/vehicles/data/datasources/vehicles_local_datasource.dart';
import 'package:starwars_clean_architecture/features/vehicles/data/datasources/vehicles_remote_datasource.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/entities/vehicle.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/repositories/vehicles_repository.dart';

class VehiclesRepositoryImpl implements VehiclesRepository {
  final VehiclesRemoteDataSource vehiclesRemoteDataSource;
  final VehiclesLocalDataSource vehiclesLocalDataSource;
  final NetworkInfo networkInfo;

  VehiclesRepositoryImpl({
    @required this.vehiclesRemoteDataSource,
    @required this.vehiclesLocalDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Vehicle>>> getVehicles(int pageNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteListOfVehicles =
            await vehiclesRemoteDataSource.getVehicles(pageNumber);
        //vehiclesLocalDataSource.cacheListOfVehicles(remoteListOfVehicles);
        return Right(remoteListOfVehicles);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localListOfVehicles = await vehiclesLocalDataSource.getListOfVehicles();
        // return Right(localListOfVehicles);
        return Left(CacheFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
