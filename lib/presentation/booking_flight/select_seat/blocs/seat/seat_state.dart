part of 'seat_bloc.dart';

enum SeatStatus { initial, loaded, error }

extension SeatStatusX on SeatStatus {
  bool get isLoaded => [SeatStatus.loaded].contains(this);
}

class SeatState extends Equatable {
  const SeatState({
    required this.seatStatus,
    required this.busineessSeat,
    required this.encomicSeat,
    required this.flightEnity,
    required this.price,
  });
  final SeatStatus seatStatus;
  final Map<String, bool> busineessSeat;
  final Map<String, bool> encomicSeat;
  final FlightEnity flightEnity;
  final String price;
  @override
  List<Object> get props =>
      [seatStatus, busineessSeat, encomicSeat, price, flightEnity];

  SeatState copyWith({
    SeatStatus? seatStatus,
    Map<String, bool>? busineessSeat,
    Map<String, bool>? encomicSeat,
    FlightEnity? flightEnity,
    String? price,
  }) {
    return SeatState(
      seatStatus: seatStatus ?? this.seatStatus,
      busineessSeat: busineessSeat ?? this.busineessSeat,
      encomicSeat: encomicSeat ?? this.encomicSeat,
      flightEnity: flightEnity ?? this.flightEnity,
      price: price ?? this.price,
    );
  }
}
