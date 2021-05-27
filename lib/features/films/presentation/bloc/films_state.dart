import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/films/domain/entities/film.dart';

@immutable
abstract class FilmsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends FilmsState {}

class Loading extends FilmsState {}

class Loaded extends FilmsState {
  final List<Film> listOfFilms;

  Loaded({@required this.listOfFilms});

  @override
  List<Object> get props => [listOfFilms];
}

class Error extends FilmsState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
