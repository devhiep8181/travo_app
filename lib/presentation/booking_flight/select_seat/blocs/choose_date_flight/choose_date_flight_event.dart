part of 'choose_date_flight_bloc.dart';

abstract class ChooseDateFlightEvent extends Equatable {
  const ChooseDateFlightEvent();

  @override
  List<Object> get props => [];
}

class ChooseDepartureDateEvent extends ChooseDateFlightEvent {
  const ChooseDepartureDateEvent({
    required this.departureDate,
    required this.twoWay,
  });
  final DateTime departureDate;
  final bool twoWay;
  @override
  List<Object> get props => [departureDate, twoWay];
}

class ChooseReturnDateEvent extends ChooseDateFlightEvent {
  const ChooseReturnDateEvent({
    required this.departureDate,
    required this.returnDate,
  });
  final DateTime departureDate;
  final DateTime returnDate;
  @override
  List<Object> get props => [departureDate, returnDate];
}
