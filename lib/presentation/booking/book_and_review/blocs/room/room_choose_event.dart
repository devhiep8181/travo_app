part of 'room_choose_bloc.dart';

abstract class RoomChooseEvent extends Equatable {
  const RoomChooseEvent();

  @override
  List<Object> get props => [];
}

class GetRoomChooseEvent extends RoomChooseEvent {
  const GetRoomChooseEvent({
    required this.roomEntity,
  });
  final RoomEntity roomEntity;

  @override
  List<Object> get props => [roomEntity];
}
