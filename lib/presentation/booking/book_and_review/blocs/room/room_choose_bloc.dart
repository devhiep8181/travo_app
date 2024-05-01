
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/room_entity.dart';

part 'room_choose_event.dart';
part 'room_choose_state.dart';

class RoomChooseBloc extends Bloc<RoomChooseEvent, RoomChooseState> {
  RoomChooseBloc()
      : super(const RoomChooseState(
            roomEntity: RoomEntity(
                hotelId: '',
                maxGuest: 0,
                image: '',
                name: '',
                price: 0,
                services: [],
                total: 0,
                typePrice: ''),
            roomChooseStatus: RoomChooseStatus.initial)) {
    on<GetRoomChooseEvent>(_onGetRoomChooseEvent);
  }

  void _onGetRoomChooseEvent(
      GetRoomChooseEvent event, Emitter<RoomChooseState> emit) {
    try {
      emit(state.copyWith(
          roomEntity: event.roomEntity,
          roomChooseStatus: RoomChooseStatus.loaded));
    } catch (e) {
      emit(state.copyWith(roomChooseStatus: RoomChooseStatus.error));
    }
  }
}
