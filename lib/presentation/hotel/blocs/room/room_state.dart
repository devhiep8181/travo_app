part of 'room_bloc.dart';

enum RoomStatus {initial, loaded, error}

extension RoomStatusX on RoomStatus{
  bool get isLoaded => [RoomStatus.loaded].contains(this);
}
class RoomState extends Equatable {
  const RoomState({required this.listRoom, required this.roomStatus});
  final List<RoomEntity> listRoom;
  final RoomStatus roomStatus;
  @override
  List<Object> get props => [listRoom, roomStatus];

  RoomState copyWith({
    List<RoomEntity>? listRoom,
    RoomStatus? roomStatus,
  }) {
    return RoomState(
      listRoom: listRoom ?? this.listRoom,
      roomStatus: roomStatus ?? this.roomStatus,
    );
  }
}

// class RoomInitial extends RoomState {}

// class RoomLoading extends RoomState {}

// class RoomLoaded extends RoomState {
//   const RoomLoaded({
//     required this.listRoom,
//   });
//   final List<RoomEntity> listRoom;
//   @override
//   List<Object> get props => [listRoom];
// }

// class RoomError extends RoomState {
//   const RoomError({
//     required this.message,
//   });
//   final String message;
//   @override
//   List<Object> get props => [message];
// }
