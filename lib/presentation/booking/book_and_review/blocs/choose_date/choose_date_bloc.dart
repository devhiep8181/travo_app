import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'choose_date_data.dart';

part 'choose_date_event.dart';
part 'choose_date_state.dart';

class ChooseDateBloc extends Bloc<ChooseDateEvent, ChooseDateState> {
  ChooseDateBloc()
      : super(const ChooseDateState(
            dayStart: '',
            dayEnd: '',
            chooseDateStatus: ChooseDateStatus.initial,
            monthEnd: '',
            monthStart: '',
            yearEnd: '',
            yearStart: '')) {
    on<ProcessDateEvent>(_onProcessDateEvent);
  }

  FutureOr<void> _onProcessDateEvent(
      ProcessDateEvent event, Emitter<ChooseDateState> emit) {
    try {
      emit(state.copyWith(
          dayStart: event.dayStart,
          dayEnd: event.dayEnd,
          monthStart: monthData[event.monthStart],
          monthEnd: monthData[event.monthEnd],
          yearStart: event.yearStart,
          yearEnd: event.yearEnd,
          chooseDateStatus: ChooseDateStatus.loaded,
          ));
    } catch (e) {
      emit(state.copyWith(chooseDateStatus: ChooseDateStatus.error));
    }
  }
}
