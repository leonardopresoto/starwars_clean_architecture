import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StarshipsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetStarshipsBlocEvent extends StarshipsEvent {
  final int numberPage;

  GetStarshipsBlocEvent(this.numberPage);

  @override
  List<Object> get props => [numberPage];
}
