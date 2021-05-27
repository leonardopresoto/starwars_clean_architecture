import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilmsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetFilmsBlocEvent extends FilmsEvent {
  final int numberPage;

  GetFilmsBlocEvent(this.numberPage);

  @override
  List<Object> get props => [numberPage];
}
