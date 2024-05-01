part of 'id_room_bloc.dart';

abstract class IdRoomEvent extends Equatable {
  const IdRoomEvent();

  @override
  List<Object> get props => [];
}

class IdRoomStarted extends IdRoomEvent{

}

class GetIdRoom extends IdRoomEvent {
  const GetIdRoom(
    {required this.idRoom}
  );
  final String? idRoom;

  @override
  List<Object> get props => [];
}
