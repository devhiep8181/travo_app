part of 'modify_or_choose_room_bloc.dart';

abstract class ModifyOrChooseRoomEvent extends Equatable {
  const ModifyOrChooseRoomEvent();

  @override
  List<Object> get props => [];
}

class ProcessModifyOrChooseRoomEvent extends ModifyOrChooseRoomEvent {
  const ProcessModifyOrChooseRoomEvent({
    required this.modifyBookingRoom,
  });
  final bool modifyBookingRoom;

  @override
  List<Object> get props => [modifyBookingRoom];
}

class GetRoomModifyEvent extends ModifyOrChooseRoomEvent {
  const GetRoomModifyEvent({
    required this.bookingEntity,
  });
  final BookingEntity bookingEntity;

  @override
  List<Object> get props => [bookingEntity];
}
