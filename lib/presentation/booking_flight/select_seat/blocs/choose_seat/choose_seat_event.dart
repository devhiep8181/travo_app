part of 'choose_seat_bloc.dart';

abstract class ChooseSeatEvent extends Equatable {
  const ChooseSeatEvent();

  @override
  List<Object> get props => [];
}

class GetSeatEvent extends ChooseSeatEvent {
  const GetSeatEvent({
    required this.seatLocation,
    required this.seatClass,
    required this.seatCheck,
    required this.keySeatEvent,
    this.countEconomyClass,
    this.coutBussinessClass,
  });
  final String seatLocation;
  final String seatClass;
  final String keySeatEvent;
  final bool seatCheck;
  final int? coutBussinessClass;
  final int? countEconomyClass;

  @override
  List<Object> get props => [
        seatClass,
        seatLocation,
        seatCheck,
        keySeatEvent,
      ];
}
