part of 'room_bloc.dart';

abstract class RoomEvent extends Equatable {
  const RoomEvent();

  @override
  List<Object> get props => [];
}

class GetRoomEvent extends RoomEvent {
  const GetRoomEvent({
    required this.idHotel,
  });
  final String idHotel;
  @override
  List<Object> get props => [idHotel];
}
