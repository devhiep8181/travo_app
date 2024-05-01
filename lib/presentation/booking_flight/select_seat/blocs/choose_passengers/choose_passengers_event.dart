part of 'choose_passengers_bloc.dart';

abstract class ChoosePassengersEvent extends Equatable {
  const ChoosePassengersEvent();

  @override
  List<Object> get props => [];
}

class ChangeStatusEvent extends ChoosePassengersEvent{}

class ExitChangeStatusEvent extends ChoosePassengersEvent{}

class IncreasePassegerEvent extends ChoosePassengersEvent{
    const IncreasePassegerEvent({
    required this.passeger,
  });
  final String passeger;
  @override
  List<Object> get props => [passeger];
}


class ReducePassegerEvent extends ChoosePassengersEvent{
    const ReducePassegerEvent({
    required this.passeger,
  });
  final String passeger;
  @override
  List<Object> get props => [passeger];
}

class ImportPassegerEvent extends ChoosePassengersEvent {
  const ImportPassegerEvent({
    required this.passeger,
  });
  final String passeger;
  @override
  List<Object> get props => [passeger];
}
