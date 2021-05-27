import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeciesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSpeciesBlocEvent extends SpeciesEvent {
  final int numberPage;

  GetSpeciesBlocEvent(this.numberPage);

  @override
  List<Object> get props => [numberPage];
}
