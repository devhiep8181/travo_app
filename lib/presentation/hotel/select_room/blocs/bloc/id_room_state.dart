part of 'id_room_bloc.dart';

abstract class IdRoomState extends Equatable {
  const IdRoomState();

  @override
  List<Object> get props => [];
}

class IdRoomInitial extends IdRoomState {}

class IdRoomLoaded extends IdRoomState {
  const IdRoomLoaded({
    required this.idRoom,
  });
  final String idRoom;

  @override
  List<Object> get props => [idRoom];
}

class IdRoomError extends IdRoomState {
  const IdRoomError({
    required this.message,
  });
  final String message;
  @override
  List<Object> get props => [message];
}
