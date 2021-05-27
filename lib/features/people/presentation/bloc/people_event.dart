import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PeopleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPeopleBlocEvent extends PeopleEvent {
  final int numberPage;

  GetPeopleBlocEvent(this.numberPage);

  @override
  List<Object> get props => [numberPage];
}
