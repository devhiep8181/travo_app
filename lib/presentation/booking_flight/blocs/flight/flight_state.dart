part of 'flight_bloc.dart';

enum FlightStatus { initial, nodata, loading, loaded, error }

extension FlightStatusX on FlightStatus {
  bool get isLoaded => [FlightStatus.loaded].contains(this);
  bool get isLoading => [FlightStatus.loading].contains(this);
  bool get isNodata => [FlightStatus.nodata].contains(this);
}

class FlightState extends Equatable {
  const FlightState({
    required this.lisFightEntity,
    required this.flightStatus,
    //required this.listSeat,
    required this.message,
  });
  final List<FlightEnity> lisFightEntity;
  final FlightStatus flightStatus;
  //final List<Map<String, Map<String, List<bool>>>> listSeat;
  final String message;
  @override
  List<Object> get props => [lisFightEntity, flightStatus, message];

  FlightState copyWith({
    List<FlightEnity>? lisFightEntity,
    FlightStatus? flightStatus,
    String? message,
  }) {
    return FlightState(
      lisFightEntity: lisFightEntity ?? this.lisFightEntity,
      flightStatus: flightStatus ?? this.flightStatus,
      message: message ?? this.message,
    );
  }
}
