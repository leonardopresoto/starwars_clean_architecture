import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/entities/vehicle.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/usecases/get_vehicles.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class VehiclesBloc extends Bloc<VehiclesEvent, VehiclesState> {
  final GetVehicles getVehicles;

  VehiclesBloc({
    required GetVehicles vehicles,
  })  : assert(vehicles != null),
        getVehicles = vehicles,
        super(Empty());

  VehiclesState get initialState => Empty();

  @override
  Stream<VehiclesState> mapEventToState(
    VehiclesEvent event,
  ) async* {
    if (event is GetVehiclesBlocEvent) {
      yield Loading();
      final failureOrVehicles = await getVehicles(Params(number: 1));
      yield* _eitherLoadedOrErrorState(failureOrVehicles);
    }
  }

  Stream<VehiclesState> _eitherLoadedOrErrorState(
    Either<Failure, List<Vehicle>> failureOrVehicles,
  ) async* {
    yield failureOrVehicles.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (listOfVehicles) => Loaded(listOfVehicles: listOfVehicles),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
