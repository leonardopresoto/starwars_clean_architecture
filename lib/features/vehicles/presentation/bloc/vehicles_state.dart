import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/entities/vehicle.dart';

@immutable
abstract class VehiclesState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends VehiclesState {}

class Loading extends VehiclesState {}

class Loaded extends VehiclesState {
  final List<Vehicle> listOfVehicles;

  Loaded({required this.listOfVehicles});

  @override
  List<Object> get props => [listOfVehicles];
}

class Error extends VehiclesState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
