import 'package:equatable/equatable.dart';

class FlightEnity extends Equatable {
  const FlightEnity({
    required this.airline,
    required this.arriveTime,
    required this.departureTime,
    required this.fromPlace,
    required this.no,
    required this.price,
    required this.toPlace,
    required this.seat,
  });
  final String? airline;
  final DateTime? arriveTime;
  final DateTime? departureTime;
  final String? fromPlace;
  final String? no;
  final int? price;
  final String? toPlace;
  final List<dynamic>? seat;

  @override
  List<Object?> get props =>
      [arriveTime, airline, departureTime, fromPlace, no, price, toPlace, seat];
}
