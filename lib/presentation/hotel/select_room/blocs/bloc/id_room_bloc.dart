
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'id_room_event.dart';
part 'id_room_state.dart';

class IdRoomBloc extends Bloc<IdRoomEvent, IdRoomState> {
  IdRoomBloc() : super(IdRoomInitial()) {
    on<GetIdRoom>(_onGetIdRoom);

  }

  void _onGetIdRoom(GetIdRoom event, Emitter<IdRoomState> emit) {
    try {
      emit(IdRoomLoaded(idRoom: event.idRoom!));
    } catch (e) {
      emit(IdRoomError(message: e.toString()));
    }
  }
}
