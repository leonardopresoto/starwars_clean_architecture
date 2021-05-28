import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/species/domain/entities/specie.dart';

@immutable
abstract class SpeciesState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends SpeciesState {}

class Loading extends SpeciesState {}

class Loaded extends SpeciesState {
  final List<Specie> listOfSpecies;

  Loaded({required this.listOfSpecies});

  @override
  List<Object> get props => [listOfSpecies];
}

class Error extends SpeciesState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
