import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'choose_passengers_event.dart';
part 'choose_passengers_state.dart';

class ChoosePassengersBloc
    extends Bloc<ChoosePassengersEvent, ChoosePassengersState> {
  ChoosePassengersBloc()
      : super(const ChoosePassengersState(
            choosePassengersStatus: ChoosePassengersStatus.initial,
            passengers: 1)) {
    on<ImportPassegerEvent>(_onImportPassegerEvent);
    on<IncreasePassegerEvent>(_onIncreasePassegerEvent);
    on<ReducePassegerEvent>(_onReducePassegerEvent);
    on<ChangeStatusEvent>(_onChangeStatusEvent);
    on<ExitChangeStatusEvent>(_onExitChangeStatusEvent);
  }

  void _onChangeStatusEvent(
      ChangeStatusEvent event, Emitter<ChoosePassengersState> emit) {
    try {
      emit(state.copyWith(
          choosePassengersStatus: ChoosePassengersStatus.loaded));
    } catch (e) {
      emit(
          state.copyWith(choosePassengersStatus: ChoosePassengersStatus.error));
    }
  }

  FutureOr<void> _onIncreasePassegerEvent(
      IncreasePassegerEvent event, Emitter<ChoosePassengersState> emit) {
    try {
      var valuePasseger = int.parse(event.passeger);
      valuePasseger++;
      emit(state.copyWith(
          passengers: valuePasseger,
          choosePassengersStatus: ChoosePassengersStatus.loaded));
    } catch (e) {
      emit(
          state.copyWith(choosePassengersStatus: ChoosePassengersStatus.error));
    }
  }

  FutureOr<void> _onReducePassegerEvent(
      ReducePassegerEvent event, Emitter<ChoosePassengersState> emit) {
    try {
      var valuePasseger = int.parse(event.passeger);
      if (valuePasseger > 1) {
        valuePasseger--;
      }
      emit(state.copyWith(
          passengers: valuePasseger,
          choosePassengersStatus: ChoosePassengersStatus.loaded));
    } catch (e) {
      emit(
          state.copyWith(choosePassengersStatus: ChoosePassengersStatus.error));
    }
  }

  void _onImportPassegerEvent(
      ImportPassegerEvent event, Emitter<ChoosePassengersState> emit) {
    try {
      final passegerValue = int.parse(event.passeger);
      if (passegerValue >= 1) {
        emit(state.copyWith(
            passengers: passegerValue,
            choosePassengersStatus: ChoosePassengersStatus.loaded));
      } else {
        emit(state.copyWith(
            choosePassengersStatus: ChoosePassengersStatus.error));
      }
    } catch (e) {
      emit(
          state.copyWith(choosePassengersStatus: ChoosePassengersStatus.error));
    }
  }

  FutureOr<void> _onExitChangeStatusEvent(
      ExitChangeStatusEvent event, Emitter<ChoosePassengersState> emit) {
    emit(
        state.copyWith(choosePassengersStatus: ChoosePassengersStatus.initial));
  }
}
