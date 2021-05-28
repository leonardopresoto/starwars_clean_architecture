import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';

@immutable
abstract class PeopleState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends PeopleState {}

class Loading extends PeopleState {}

class Loaded extends PeopleState {
  final List<Person> listOfPeople;

  Loaded({required this.listOfPeople});

  @override
  List<Object> get props => [listOfPeople];
}

class Error extends PeopleState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
