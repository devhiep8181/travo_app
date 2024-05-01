import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_passenger_event.dart';
part 'add_passenger_state.dart';

class AddPassengerBloc extends Bloc<AddPassengerEvent, AddPassengerState> {
  AddPassengerBloc()
      : super(const AddPassengerState(
            addPassengerStatus: AddPassengerStatus.initial,
            mapValueIndentity: {},
            mapValueName: {},
            mapEmail: {})) {
    on<ProcessAddPassengerEvent>(_onProcessAddPassengerEvent);
    on<UpdateEmailPassengerEvent>(_onUpdateEmailPassengerEvent);
    on<UpdateIndentityPassengerEvent>(_onUpdateIndentityPassengerEvent);
    on<UpdateNamePassengerEvent>(_onUpdateNamePassengerEvent);
  }

  void _onProcessAddPassengerEvent(
      ProcessAddPassengerEvent event, Emitter<AddPassengerState> emit) {
    try {
      emit(state.copyWith(addPassengerStatus: AddPassengerStatus.loading));
      final mapValueIndentity = Map<int, String>.from(state.mapValueIndentity);
      final mapValueName = Map<String, String>.from(state.mapValueName);
      final mapEmail = Map<String, String>.from(state.mapEmail);
      // if (mapValueIndentity.containsKey(event.keyMapIndentity)) {
      //   mapValueIndentity[event.keyMapIndentity] = event.indentity;
      //   mapValueName[event.indentity] = event.namePassenger;
      // } else {
      //   mapValueIndentity[event.keyMapIndentity] = event.indentity;
      //   mapValueName[event.indentity] = event.namePassenger;
      // }

      mapValueIndentity[event.keyMapIndentity] = event.indentity;
      mapValueName[event.indentity] = event.namePassenger;
      mapEmail[event.indentity] = event.email;

      emit(state.copyWith(
          mapValueIndentity: mapValueIndentity,
          mapValueName: mapValueName,
          mapEmail: mapEmail,
          addPassengerStatus: AddPassengerStatus.loaded));
      if (event.countPassengers == mapValueIndentity.length) {
        emit(state.copyWith(
            mapValueIndentity: mapValueIndentity,
            mapValueName: mapValueName,
            mapEmail: mapEmail,
            addPassengerStatus: AddPassengerStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(addPassengerStatus: AddPassengerStatus.error));
    }
  }

  FutureOr<void> _onUpdateEmailPassengerEvent(
      UpdateEmailPassengerEvent event, Emitter<AddPassengerState> emit) {
    try {
      final mapValueIndentity = Map<int, String>.from(state.mapValueIndentity);
      final mapValueName = Map<String, String>.from(state.mapValueName);
      final mapEmail = Map<String, String>.from(state.mapEmail);
      if (mapEmail.containsKey(event.keyEmail)) {
        mapEmail[event.keyEmail] = event.emailUpdate;
      }
      emit(state.copyWith(
          mapValueIndentity: mapValueIndentity,
          mapValueName: mapValueName,
          mapEmail: mapEmail,
          addPassengerStatus: AddPassengerStatus.success));
    } catch (e) {
      emit(state.copyWith(addPassengerStatus: AddPassengerStatus.error));
    }
  }

  FutureOr<void> _onUpdateIndentityPassengerEvent(
      UpdateIndentityPassengerEvent event, Emitter<AddPassengerState> emit) {
     try {
      final mapValueIndentity = Map<int, String>.from(state.mapValueIndentity);
      final mapValueName = Map<String, String>.from(state.mapValueName);
      final mapEmail = Map<String, String>.from(state.mapEmail);
      if (mapValueIndentity.containsKey(event.keyIndentity)) {
        mapValueIndentity[event.keyIndentity] = event.indentityUpdate;
      }
      emit(state.copyWith(
          mapValueIndentity: mapValueIndentity,
          mapValueName: mapValueName,
          mapEmail: mapEmail,
          addPassengerStatus: AddPassengerStatus.success));
    } catch (e) {
      emit(state.copyWith(addPassengerStatus: AddPassengerStatus.error));
    }
  }

  FutureOr<void> _onUpdateNamePassengerEvent(
      UpdateNamePassengerEvent event, Emitter<AddPassengerState> emit) {
    try {
      final mapValueIndentity = Map<int, String>.from(state.mapValueIndentity);
      final mapValueName = Map<String, String>.from(state.mapValueName);
      final mapEmail = Map<String, String>.from(state.mapEmail);
      if (mapValueName.containsKey(event.keyName)) {
        mapValueName[event.keyName] = event.name;
      }
      emit(state.copyWith(
          mapValueIndentity: mapValueIndentity,
          mapValueName: mapValueName,
          mapEmail: mapEmail,
          addPassengerStatus: AddPassengerStatus.success));
    } catch (e) {
      emit(state.copyWith(addPassengerStatus: AddPassengerStatus.error));
    }
  }
}
