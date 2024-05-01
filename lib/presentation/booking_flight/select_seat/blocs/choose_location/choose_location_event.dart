part of 'choose_location_bloc.dart';

abstract class ChooseLocationEvent extends Equatable {
  const ChooseLocationEvent();

  @override
  List<Object> get props => [];
}

class GetChooseFromLoactionEvent extends ChooseLocationEvent {
  const GetChooseFromLoactionEvent({
    required this.locationFromName,
    required this.locationToName,
    required this.twoWay,
  });

  final String locationFromName;
  final String locationToName;
  final bool twoWay;

  @override
  List<Object> get props => [locationFromName, locationToName, twoWay];
}

class GetChooseToLocationEvent extends ChooseLocationEvent {
  const GetChooseToLocationEvent({
    required this.loactionToName,
    required this.locationFromName,
    required this.twoWay,
  });
  final String loactionToName;
  final String locationFromName;
  final bool twoWay;

  @override
  List<Object> get props => [loactionToName, locationFromName, twoWay];
}

class ConvertLocationEvent extends ChooseLocationEvent {
  const ConvertLocationEvent({
    required this.twoWay,
  });
  final bool twoWay;
  @override
  List<Object> get props => [twoWay];
}

class InitLocationEvent extends ChooseLocationEvent {}
