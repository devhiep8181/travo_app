part of 'choose_guest_bloc.dart';

enum ChooseGuestStatus { initial, loaded }

class ChooseGuestState extends Equatable {
  const ChooseGuestState({required this.chooseGuestStatus, required this.valueGuest});
  final String valueGuest;
  final ChooseGuestStatus chooseGuestStatus;

  @override
  List<Object> get props => [chooseGuestStatus, valueGuest];

  ChooseGuestState copyWith({
    String? valueGuest,
    ChooseGuestStatus? chooseGuestStatus,
  }) {
    return ChooseGuestState(
      valueGuest: valueGuest ?? this.valueGuest,
      chooseGuestStatus: chooseGuestStatus ?? this.chooseGuestStatus,
    );
  }
}

