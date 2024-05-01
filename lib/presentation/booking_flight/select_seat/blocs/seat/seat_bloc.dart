import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/flight_entity.dart';

part 'seat_event.dart';
part 'seat_state.dart';

class SeatBloc extends Bloc<SeatEvent, SeatState> {
  SeatBloc()
      : super(SeatState(
          busineessSeat: const {},
          encomicSeat: const {},
          flightEnity: FlightEnity(
              airline: '',
              arriveTime: DateTime.now(),
              departureTime: DateTime.now(),
              fromPlace: '',
              no: '',
              price: 0,
              toPlace: '',
              seat: const []),
          seatStatus: SeatStatus.initial,
          price: '',
        )) {
    on<ProcessSeatEvent>(_onProcessSeatEvent);
  }

  FutureOr<void> _onProcessSeatEvent(
      ProcessSeatEvent event, Emitter<SeatState> emit) {
    try {
      final businessSeat = <String, bool>{};
      final encomicSeat = <String, bool>{};
      for (final entry in event.listBusinessSeat.entries) {
        final key = entry.key;
        final value = entry.value as List<dynamic>;
        for (var i = 0; i < value.length; i++) {
          final keyBool = '$key$i';
          businessSeat[keyBool] = value[i] as bool;
        }
      }

      for (final entry in event.listEncomicSeat.entries) {
        final key = entry.key;
        final value = entry.value as List<dynamic>;
        for (var i = 0; i < value.length; i++) {
          final keyBool = '$key$i';
          encomicSeat[keyBool] = value[i] as bool;
        }
      }

      emit(state.copyWith(
        seatStatus: SeatStatus.loaded,
        busineessSeat: businessSeat,
        encomicSeat: encomicSeat,
        price: event.price,
        flightEnity: event.flightEnity,
      ));
    } catch (e) {
      emit(state.copyWith(seatStatus: SeatStatus.error));
    }
  }
}
