import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/app_export.dart';
import '../../../../core/errors/failures.dart';
import '../../../../domain/entities/room_entity.dart';
import '../../../../domain/usecases/room/get_room_usecase.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc({required this.getRoomUseCase})
      : super(const RoomState(listRoom: [], roomStatus: RoomStatus.initial)) {
    on<GetRoomEvent>(_onGetRoomEvent);
  }
  final GetRoomUseCase getRoomUseCase;

  FutureOr<void> _onGetRoomEvent(
      GetRoomEvent event, Emitter<RoomState> emit) async {
    try {
      //emit(RoomLoading());
      final result =
          await getRoomUseCase(HotelIdParams(hotelId: event.idHotel));
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(roomStatus: RoomStatus.error))
              : TextConstant.defaultErrorMessage,
          (success) => emit(state.copyWith(
              listRoom: success, roomStatus: RoomStatus.loaded)));
    } catch (e) {
      emit(state.copyWith(roomStatus: RoomStatus.error));
    }
  }
}
