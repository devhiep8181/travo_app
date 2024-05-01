import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/app_export.dart';

part 'choose_location_event.dart';
part 'choose_location_state.dart';

class ChooseLocationBloc
    extends Bloc<ChooseLocationEvent, ChooseLocationState> {
  ChooseLocationBloc()
      : super(const ChooseLocationState(
            locationFromName: {},
            locationToName: {},
            locationStatus: ChooseLocationStatus.initial)) {
    on<GetChooseFromLoactionEvent>(_onGetChooseFromLoactionEvent);
    on<GetChooseToLocationEvent>(_onGetChooseToLocationEvent);
    on<ConvertLocationEvent>(_onConvertLocationEvent);
    on<InitLocationEvent>(_onInitLocationEvent);
  }

  FutureOr<void> _onGetChooseFromLoactionEvent(
      GetChooseFromLoactionEvent event, Emitter<ChooseLocationState> emit) {
    try {
      emit(state.copyWith(locationStatus: ChooseLocationStatus.initial));
      final mapToLocation = Map<String, String>.from(state.locationToName);
      final mapFromLoaction = Map<String, String>.from(state.locationFromName);

      if (mapToLocation[TextConstant.keyLocationFlight1] == '') {
        mapToLocation[TextConstant.keyLocationFlight1] = event.locationToName;
      }

      if (event.twoWay) {
        if (mapToLocation[TextConstant.keyLocationFlight2] == '') {
          mapToLocation[TextConstant.keyLocationFlight2] = event.locationToName;
        }
        mapFromLoaction[TextConstant.keyLocationFlight2] =
            event.locationFromName;
      } else {
        mapFromLoaction[TextConstant.keyLocationFlight1] =
            event.locationFromName;
      }

      emit(state.copyWith(
          locationFromName: mapFromLoaction,
          locationToName: mapToLocation,
          locationStatus: ChooseLocationStatus.loaded));
    } catch (e) {
      emit(state.copyWith(locationStatus: ChooseLocationStatus.error));
    }
  }

  FutureOr<void> _onGetChooseToLocationEvent(
      GetChooseToLocationEvent event, Emitter<ChooseLocationState> emit) {
    try {
      emit(state.copyWith(locationStatus: ChooseLocationStatus.initial));
      final mapToLocation = Map<String, String>.from(state.locationToName);
      final mapFromLoaction = Map<String, String>.from(state.locationFromName);

      if (mapFromLoaction[TextConstant.keyLocationFlight1] == '') {
        mapFromLoaction[TextConstant.keyLocationFlight1] =
            event.locationFromName;
      }

      if (event.twoWay) {
        if (mapFromLoaction[TextConstant.keyLocationFlight2] == '') {
          mapFromLoaction[TextConstant.keyLocationFlight2] =
              event.locationFromName;
        }
        mapToLocation[TextConstant.keyLocationFlight2] = event.loactionToName;
      } else {
        mapToLocation[TextConstant.keyLocationFlight1] = event.loactionToName;
      }
      emit(state.copyWith(
          locationToName: mapToLocation,
          locationFromName: mapFromLoaction,
          locationStatus: ChooseLocationStatus.loaded));
    } catch (e) {
      emit(state.copyWith(locationStatus: ChooseLocationStatus.error));
    }
  }

  FutureOr<void> _onConvertLocationEvent(
      ConvertLocationEvent event, Emitter<ChooseLocationState> emit) {
    try {
      emit(state.copyWith(locationStatus: ChooseLocationStatus.initial));

      final mapToLocation = Map<String, String>.from(state.locationToName);
      final mapFromLoaction = Map<String, String>.from(state.locationFromName);

      if (event.twoWay) {
        if (mapFromLoaction[TextConstant.keyLocationFlight2] == null ||
            mapToLocation[TextConstant.keyLocationFlight2] == null) {
          emit(state.copyWith(locationStatus: ChooseLocationStatus.error));
        } else {
          emit(state.copyWith(
            locationFromName: mapToLocation,
            locationToName: mapFromLoaction,
            locationStatus: ChooseLocationStatus.loaded,
          ));
        }
      } else {
        if (mapFromLoaction[TextConstant.keyLocationFlight1] == null ||
            mapToLocation[TextConstant.keyLocationFlight1] == null) {
          emit(state.copyWith(locationStatus: ChooseLocationStatus.error));
        } else {
          emit(state.copyWith(
            locationFromName: mapToLocation,
            locationToName: mapFromLoaction,
            locationStatus: ChooseLocationStatus.loaded,
          ));
        }
      }
    } catch (e) {
      emit(state.copyWith(locationStatus: ChooseLocationStatus.error));
    }
  }

  FutureOr<void> _onInitLocationEvent(
      InitLocationEvent event, Emitter<ChooseLocationState> emit) {
    try {
      emit(state.copyWith(locationStatus: ChooseLocationStatus.initial));
    } catch (e) {
      emit(state.copyWith(locationStatus: ChooseLocationStatus.error));
    }
  }
}
