part of 'choose_room_bloc.dart';

enum ChooseRoomStatus { initial, loaded }

class ChooseRoomState extends Equatable {
  const ChooseRoomState({required this.valueRoom, required this.chooseRoomStatus});
  final String valueRoom;
  final ChooseRoomStatus chooseRoomStatus;

  @override
  List<Object> get props => [valueRoom, chooseRoomStatus];

  ChooseRoomState copyWith({
    String? valueRoom,
    ChooseRoomStatus? chooseRoomStatus,
  }) {
    return ChooseRoomState(
      valueRoom: valueRoom ?? this.valueRoom,
      chooseRoomStatus: chooseRoomStatus ?? this.chooseRoomStatus,
    );
  }
}
