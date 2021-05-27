import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VehiclesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetVehiclesBlocEvent extends VehiclesEvent {
  final int numberPage;

  GetVehiclesBlocEvent(this.numberPage);

  @override
  List<Object> get props => [numberPage];
}
