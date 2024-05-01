part of 'seat_bloc.dart';

abstract class SeatEvent extends Equatable {
  const SeatEvent();

  @override
  List<Object> get props => [];
}

class ProcessSeatEvent extends SeatEvent {
  const ProcessSeatEvent({
    required this.listBusinessSeat,
    required this.listEncomicSeat,
    required this.flightEnity,
    required this.price,
  });
  final Map<String, dynamic> listBusinessSeat;
  final Map<String, dynamic> listEncomicSeat;
  final FlightEnity flightEnity;
  final String price;

  @override
  List<Object> get props => [listBusinessSeat, listEncomicSeat, price, flightEnity];
}
