import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/booking_flight_entity.dart';

part 'modify_or_choose_flight_event.dart';
part 'modify_or_choose_flight_state.dart';

class ModifyOrChooseFlightBloc
    extends Bloc<ModifyOrChooseFlightEvent, ModifyOrChooseFlightState> {
  ModifyOrChooseFlightBloc()
      : super(const ModifyOrChooseFlightState(
            bookingFlightEntity: BookingFlightEntity(),
            modifyBookingFlight: false,
            modifyOrChooseFlightStatus: ModifyOrChooseFlightStatus.initial)) {
    on<ProcessFlightBooking>(_onProcessFlightBooking);
    on<GetFlightBookingEvent>(_onGetFlightBookingEvent);
    on<ModifyFlightBookingEvent>(_onModifyFlightBookingEvent);
  }

  FutureOr<void> _onProcessFlightBooking(
      ProcessFlightBooking event, Emitter<ModifyOrChooseFlightState> emit) {
    emit(state.copyWith(
        modifyBookingFlight: event.modifyFlightBooking,
        modifyOrChooseFlightStatus: ModifyOrChooseFlightStatus.loaded));
  }

  FutureOr<void> _onGetFlightBookingEvent(
      GetFlightBookingEvent event, Emitter<ModifyOrChooseFlightState> emit) {
    try {
      emit(state.copyWith(
          bookingFlightEntity: event.bookingFlightEntity,
          modifyBookingFlight: event.modifyFlightBooking,
          modifyOrChooseFlightStatus: ModifyOrChooseFlightStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          modifyOrChooseFlightStatus: ModifyOrChooseFlightStatus.error));
    }
  }

  FutureOr<void> _onModifyFlightBookingEvent(
      ModifyFlightBookingEvent event, Emitter<ModifyOrChooseFlightState> emit) {
    try {
      emit(state.copyWith(
          bookingFlightEntity: event.bookingFlightEntity,
          modifyOrChooseFlightStatus: ModifyOrChooseFlightStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          modifyOrChooseFlightStatus: ModifyOrChooseFlightStatus.error));
    }
  }
}
