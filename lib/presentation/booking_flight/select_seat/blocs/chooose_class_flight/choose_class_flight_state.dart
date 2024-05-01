part of 'choose_class_flight_bloc.dart';

enum ChooseClassFlightStatus { initial, loaded, error }

extension ChooseClassFlightStatusX on ChooseClassFlightStatus {
  bool get isLoaded => [ChooseClassFlightStatus.loaded].contains(this);
}

class ChooseClassFlightState extends Equatable {
  const ChooseClassFlightState(
      {required this.chooseClassFlightStatus, required this.valueClassFlight, required this.countBusinessClass, required this.countEconomyClass});
  final ChooseClassFlightStatus chooseClassFlightStatus;
  final Map<int, String> valueClassFlight;
  final int countBusinessClass;
  final int countEconomyClass;

  @override
  List<Object> get props => [chooseClassFlightStatus, valueClassFlight];

  ChooseClassFlightState copyWith({
    ChooseClassFlightStatus? chooseClassFlightStatus,
    Map<int, String>? valueClassFlight,
    int? countBusinessClass,
    int? countEconomyClass,
  }) {
    return ChooseClassFlightState(
      chooseClassFlightStatus: chooseClassFlightStatus ?? this.chooseClassFlightStatus,
      valueClassFlight: valueClassFlight ?? this.valueClassFlight,
      countBusinessClass: countBusinessClass ?? this.countBusinessClass,
      countEconomyClass: countEconomyClass ?? this.countEconomyClass,
    );
  }
}
