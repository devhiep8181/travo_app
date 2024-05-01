part of 'modify_or_choose_flight_bloc.dart';

enum ModifyOrChooseFlightStatus { initial, loaded, error }

extension ModifyOrChooseFlightStatusX on ModifyOrChooseFlightStatus {
  bool get isLoaded => [ModifyOrChooseFlightStatus.loaded].contains(this);
}

class ModifyOrChooseFlightState extends Equatable {
  const ModifyOrChooseFlightState({
    required this.bookingFlightEntity,
    required this.modifyBookingFlight,
    required this.modifyOrChooseFlightStatus,
  });
  final bool modifyBookingFlight;
  final BookingFlightEntity bookingFlightEntity;
  final ModifyOrChooseFlightStatus modifyOrChooseFlightStatus;
  @override
  List<Object> get props =>
      [modifyBookingFlight, bookingFlightEntity, modifyOrChooseFlightStatus];

  ModifyOrChooseFlightState copyWith({
    bool? modifyBookingFlight,
    BookingFlightEntity? bookingFlightEntity,
    ModifyOrChooseFlightStatus? modifyOrChooseFlightStatus,
  }) {
    return ModifyOrChooseFlightState(
      modifyBookingFlight: modifyBookingFlight ?? this.modifyBookingFlight,
      bookingFlightEntity: bookingFlightEntity ?? this.bookingFlightEntity,
      modifyOrChooseFlightStatus:
          modifyOrChooseFlightStatus ?? this.modifyOrChooseFlightStatus,
    );
  }
}
