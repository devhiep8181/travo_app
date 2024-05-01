part of 'choose_class_flight_bloc.dart';

abstract class ChooseClassFlightEvent extends Equatable {
  const ChooseClassFlightEvent();

  @override
  List<Object> get props => [];
}

class ProcessClassFlightEvent extends ChooseClassFlightEvent {
  const ProcessClassFlightEvent({
    required this.valueClassFlight,
    required this.indexClassFlight,
  });
  final String valueClassFlight;
  final int indexClassFlight;

  @override
  List<Object> get props => [valueClassFlight, indexClassFlight];
}

class RefreshClasFlightEvent extends ChooseClassFlightEvent {
  const RefreshClasFlightEvent({
    required this.countBussnessClass,
    required this.countEconomyClass,
  });
  final int countBussnessClass;
  final int countEconomyClass;
  @override
  List<Object> get props => [countBussnessClass, countEconomyClass];
}
