import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';

@immutable
abstract class PlanetsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends PlanetsState {}

class Loading extends PlanetsState {}

class Loaded extends PlanetsState {
  final List<Planet> listOfPlanets;

  Loaded({@required this.listOfPlanets});

  @override
  List<Object> get props => [listOfPlanets];
}

class Error extends PlanetsState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
