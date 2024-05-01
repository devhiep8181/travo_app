
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'choose_room_event.dart';
part 'choose_room_state.dart';

class ChooseRoomBloc extends Bloc<ChooseRoomEvent, ChooseRoomState> {
  ChooseRoomBloc()
      : super(const ChooseRoomState(
            valueRoom: '1', chooseRoomStatus: ChooseRoomStatus.initial)) {
    on<ImportRoomEvent>(_onImportRoomEvent);
    on<IncreaseRoomEvent>(_onIncreaseRoomEvent);
    on<ReduceRoomEvent>(_onReduceRoomEvent);
  }

  void _onImportRoomEvent(
      ImportRoomEvent event, Emitter<ChooseRoomState> emit) {
    emit(state.copyWith(
        valueRoom: event.valueRoom, chooseRoomStatus: ChooseRoomStatus.loaded));
  }

  void _onIncreaseRoomEvent(
      IncreaseRoomEvent event, Emitter<ChooseRoomState> emit) {
    var valueRoom = int.parse(event.valueRoom);
    valueRoom++;
    emit(state.copyWith(
        valueRoom: valueRoom.toString(),
        chooseRoomStatus: ChooseRoomStatus.loaded));
  }

  void _onReduceRoomEvent(
      ReduceRoomEvent event, Emitter<ChooseRoomState> emit) {
    var valueRoom = int.parse(event.valueRoom);
    if (valueRoom > 1) {
      valueRoom--;
    }

    emit(state.copyWith(
        valueRoom: valueRoom.toString(),
        chooseRoomStatus: ChooseRoomStatus.loaded));
  }
}
