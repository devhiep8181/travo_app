part of 'confirm_flight_bloc.dart';

enum ConfirmFlightStatus { initial, success, error }

extension ConfirmFlightStatusX on ConfirmFlightStatus {
  bool get isSuccess => [ConfirmFlightStatus.success].contains(this);
  bool get isError => [ConfirmFlightStatus.error].contains(this);
}

class ConfirmFlightState extends Equatable {
  const ConfirmFlightState(
      {required this.bookingFlightEntity,
      required this.confirmFlightStatus,
      required this.message});
  final List<BookingFlightEntity> bookingFlightEntity;
  final ConfirmFlightStatus confirmFlightStatus;
  final String message;
  @override
  List<Object> get props => [bookingFlightEntity, confirmFlightStatus, message];

  ConfirmFlightState copyWith({
    List<BookingFlightEntity>? bookingFlightEntity,
    ConfirmFlightStatus? confirmFlightStatus,
    String? message,
  }) {
    return ConfirmFlightState(
      bookingFlightEntity: bookingFlightEntity ?? this.bookingFlightEntity,
      confirmFlightStatus: confirmFlightStatus ?? this.confirmFlightStatus,
      message: message ?? this.message,
    );
  }
}
