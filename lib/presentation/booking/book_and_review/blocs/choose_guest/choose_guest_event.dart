part of 'choose_guest_bloc.dart';

abstract class ChooseGuestEvent extends Equatable {
  const ChooseGuestEvent();

  @override
  List<Object> get props => [];
}

class IncreaseGuestEvent extends ChooseGuestEvent {
  const IncreaseGuestEvent({
    required this.valueGuest,
  });
  final String valueGuest;

  @override
  List<Object> get props => [valueGuest];
}

class ReduceGuestEvent extends ChooseGuestEvent {
  const ReduceGuestEvent({
    required this.valueGuest,
  });
  final String valueGuest;

  @override
  List<Object> get props => [valueGuest];
}

class ImportGuestEvent extends ChooseGuestEvent {
  const ImportGuestEvent({
    required this.valueGuest,
  });
  final String valueGuest;

  @override
  List<Object> get props => [valueGuest];
}
