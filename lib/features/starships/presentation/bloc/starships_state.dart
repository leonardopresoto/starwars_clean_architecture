import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/starships/domain/entities/starship.dart';

@immutable
abstract class StarshipsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends StarshipsState {}

class Loading extends StarshipsState {}

class Loaded extends StarshipsState {
  final List<Starship> listOfStarships;

  Loaded({required this.listOfStarships});

  @override
  List<Object> get props => [listOfStarships];
}

class Error extends StarshipsState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
