part of 'modify_or_choose_room_bloc.dart';

enum ModifyorChooseRoomStatus { initial, loaded, error }

extension ModifyorChooseRoomStatusX on ModifyorChooseRoomStatus {
  bool get isLoaded => [ModifyorChooseRoomStatus.loaded].contains(this);
}

class ModifyOrChooseRoomState extends Equatable {
  const ModifyOrChooseRoomState(
      {required this.modifyBookingRoom,
      required this.modifyorChooseRoomStatus,
      required this.bookingEntity,
      });

  final bool modifyBookingRoom;
  final ModifyorChooseRoomStatus modifyorChooseRoomStatus;
  final BookingEntity bookingEntity;

  @override
  List<Object> get props => [modifyBookingRoom, modifyorChooseRoomStatus, bookingEntity];

  ModifyOrChooseRoomState copyWith({
    bool? modifyBookingRoom,
    ModifyorChooseRoomStatus? modifyorChooseRoomStatus,
    BookingEntity? bookingEntity,
  }) {
    return ModifyOrChooseRoomState(
      modifyBookingRoom: modifyBookingRoom ?? this.modifyBookingRoom,
      modifyorChooseRoomStatus: modifyorChooseRoomStatus ?? this.modifyorChooseRoomStatus,
      bookingEntity: bookingEntity ?? this.bookingEntity,
    );
  }
}
