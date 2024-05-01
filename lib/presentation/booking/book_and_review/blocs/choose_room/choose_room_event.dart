part of 'choose_room_bloc.dart';

abstract class ChooseRoomEvent extends Equatable {
  const ChooseRoomEvent();

  @override
  List<Object> get props => [];
}


class IncreaseRoomEvent extends ChooseRoomEvent {
  const IncreaseRoomEvent({
    required this.valueRoom,
  });

  final String valueRoom;

  @override
  List<Object> get props => [valueRoom];
}

class ReduceRoomEvent extends ChooseRoomEvent {
  const ReduceRoomEvent({
    required this.valueRoom,
  });
 
  final String valueRoom;

  @override
  List<Object> get props => [valueRoom];
}

class ImportRoomEvent extends ChooseRoomEvent {
  const ImportRoomEvent({
    required this.valueRoom,
  });

  final String valueRoom;

  @override
  List<Object> get props => [valueRoom];
}
