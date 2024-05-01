import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/text_constant.dart';
import '../../../../domain/entities/flight_entity.dart';
import '../../../../domain/usecases/flight/get_flight_usecase.dart';

part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightBloc({required this.getFlightUseCase})
      : super(const FlightState(
            lisFightEntity: [],
            flightStatus: FlightStatus.initial,
            message: '')) {
    on<GetFlightEvent>(_onGetFlightEvent);
    on<SearchListFlightEvent>(_onSearchListFlightEvent);
  }
  final GetFlightUseCase getFlightUseCase;

  FutureOr<void> _onGetFlightEvent(
      GetFlightEvent event, Emitter<FlightState> emit) async {
    try {
      emit(state.copyWith(flightStatus: FlightStatus.loading));
      final result = await getFlightUseCase(NoParams());
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)), (success) {
        final listFlight = success
            .where((flight) =>
                flight.fromPlace == event.fromFlight &&
                flight.toPlace == event.toFlight)
            .toList();
        if (listFlight.isEmpty) {
          emit(state.copyWith(flightStatus: FlightStatus.nodata));
        } else {
          emit(state.copyWith(
              lisFightEntity: listFlight, flightStatus: FlightStatus.loaded));
        }
      });
    } catch (e) {
      emit(state.copyWith(message: e.toString()));
    }
  }

  // FutureOr<void> _onGetListSeatFlightEvent(
  //     GetListSeatFlightEvent event, Emitter<FlightState> emit) {
  //   try {
  //     final flightList = List<FlightEnity>.from(state.lisFightEntity);
  //   } catch (e) {
  //     emit(state.copyWith(flightStatus: FlightStatus.error));
  //   }
  // }

  void _onSearchListFlightEvent(
      SearchListFlightEvent event, Emitter<FlightState> emit) {
    try {
      final listFlight = <FlightEnity>[];
      for (final flight in state.lisFightEntity) {
        if (flight.fromPlace == event.fromFlight &&
            flight.toPlace == event.toFlight) {
          listFlight.add(flight);
        }
      }
      emit(state.copyWith(
          lisFightEntity: listFlight, flightStatus: FlightStatus.loaded));
    } catch (e) {
      emit(state.copyWith(flightStatus: FlightStatus.error));
    }
  }
}
