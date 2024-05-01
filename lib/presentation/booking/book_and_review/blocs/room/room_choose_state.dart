part of 'room_choose_bloc.dart';

enum RoomChooseStatus { initial, loaded, error }

extension RoomChooseStatusX on RoomChooseStatus {
  bool get isLoaded => [RoomChooseStatus.loaded].contains(this);
}

class RoomChooseState extends Equatable {
  const RoomChooseState({
    required this.roomEntity,
    required this.roomChooseStatus,
  });
  final RoomEntity roomEntity;
  final RoomChooseStatus roomChooseStatus;

  @override
  List<Object> get props => [roomEntity, roomChooseStatus];

  RoomChooseState copyWith({
    RoomEntity? roomEntity,
    RoomChooseStatus? roomChooseStatus,
  }) {
    return RoomChooseState(
      roomEntity: roomEntity ?? this.roomEntity,
      roomChooseStatus: roomChooseStatus ?? this.roomChooseStatus,
    );
  }
}

// class RoomChooseInitial extends RoomChooseState {}

// class RoomChooseLoaded extends RoomChooseState {
//   const RoomChooseLoaded({
//     required this.roomEntity,
//   });
//   final RoomEntity roomEntity;

//   @override
//   List<Object> get props => [roomEntity];
// }

// class RoomChooseError extends RoomChooseState {
//   const RoomChooseError({
//     required this.message,
//   });
//   final String message;

//   @override
//   List<Object> get props => [message];
// }
