part of 'modify_or_choose_flight_bloc.dart';

abstract class ModifyOrChooseFlightEvent extends Equatable {
  const ModifyOrChooseFlightEvent();

  @override
  List<Object> get props => [];
}

class GetFlightBookingEvent extends ModifyOrChooseFlightEvent {
  const GetFlightBookingEvent({
    required this.bookingFlightEntity,
    required this.modifyFlightBooking,
  });
  final BookingFlightEntity bookingFlightEntity;
  final bool modifyFlightBooking;

  @override
  List<Object> get props => [bookingFlightEntity, modifyFlightBooking];
}

class ProcessFlightBooking extends ModifyOrChooseFlightEvent {
  const ProcessFlightBooking({
    required this.modifyFlightBooking,
  });
  final bool modifyFlightBooking;

  @override
  List<Object> get props => [modifyFlightBooking];
}

class ModifyFlightBookingEvent extends ModifyOrChooseFlightEvent {
  const ModifyFlightBookingEvent({
    required this.bookingFlightEntity,
  });
  final BookingFlightEntity bookingFlightEntity;
  @override
  List<Object> get props => [bookingFlightEntity];
}
