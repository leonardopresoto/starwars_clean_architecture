import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PlanetsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPlanetsBlocEvent extends PlanetsEvent {
  final int numberPage;

  GetPlanetsBlocEvent(this.numberPage);

  @override
  List<Object> get props => [numberPage];
}
