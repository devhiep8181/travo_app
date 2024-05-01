part of 'choose_date_flight_bloc.dart';

enum ChooseDateFlightStatus { initial, loaded, error }

extension ChooseDateFlightStatusX on ChooseDateFlightStatus {
  bool get isLoaded => [ChooseDateFlightStatus.loaded].contains(this);
}

class ChooseDateFlightState extends Equatable {
  const ChooseDateFlightState({
    required this.depatureDate,
    required this.returnDate,
    required this.message,
    required this.chooseDateFlightStatus,
  });
  final Map<String, String> depatureDate;
  final String returnDate;
  final String message;
  final ChooseDateFlightStatus chooseDateFlightStatus;

  @override
  List<Object> get props =>
      [depatureDate, returnDate, chooseDateFlightStatus, message];

  ChooseDateFlightState copyWith({
    Map<String, String>? depatureDate,
    String? returnDate,
    String? message,
    ChooseDateFlightStatus? chooseDateFlightStatus,
  }) {
    return ChooseDateFlightState(
      depatureDate: depatureDate ?? this.depatureDate,
      returnDate: returnDate ?? this.returnDate,
      message: message ?? this.message,
      chooseDateFlightStatus:
          chooseDateFlightStatus ?? this.chooseDateFlightStatus,
    );
  }
}
