part of 'flight_bloc.dart';

abstract class FlightEvent extends Equatable {
  const FlightEvent();

  @override
  List<Object> get props => [];
}

class GetFlightEvent extends FlightEvent {
  const GetFlightEvent({
    required this.toFlight,
    required this.fromFlight,
  });
   final String toFlight;
  final String fromFlight;

  @override
  List<Object> get props => [toFlight, fromFlight];
}

class GetListSeatFlightEvent extends FlightEvent {}

class SearchListFlightEvent extends FlightEvent {
  const SearchListFlightEvent({
    required this.toFlight,
    required this.fromFlight,
  });
  final String toFlight;
  final String fromFlight;

  @override
  List<Object> get props => [toFlight, fromFlight];
}
