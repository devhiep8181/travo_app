part of 'confirm_flight_bloc.dart';

abstract class ConfirmFlightEvent extends Equatable {
  const ConfirmFlightEvent();

  @override
  List<Object> get props => [];
}

class GetBookingFlightEvent extends ConfirmFlightEvent {
  const GetBookingFlightEvent({
    required this.email,
  });
  final String email;

  @override
  List<Object> get props => [email];
}

class ProcessConfirmFlightEvent extends ConfirmFlightEvent {
  const ProcessConfirmFlightEvent({
    required this.creatAt,
    required this.emailUser,
    required this.passengers,
    required this.totalPrice,
    required this.promoCode,
    required this.nameAirline,
    required this.seats,
    required this.classSeats,
    required this.date,
    required this.typePayment,
    required this.numberCard,
    required this.expDate,
    required this.cvv,
    required this.country,
    required this.mapValueNameGuest,
    required this.mapValueIndentity,
  });
  final String creatAt;
  final String emailUser;
  final int passengers;
  final double totalPrice;
  final String promoCode;
  final String nameAirline;
  final Map<String, String> seats;
  final Map<String, String> classSeats;
  final Map<String, String> mapValueNameGuest;
  final Map<int, String> mapValueIndentity;
  final String date;
  final String typePayment;
  final String numberCard;
  final String expDate;
  final String cvv;
  final String country;

  @override
  List<Object> get props => [
        creatAt,
        emailUser,
        passengers,
        totalPrice,
        promoCode,
        nameAirline,
        seats,
        classSeats,
        date,
        typePayment,
        numberCard,
        expDate,
        cvv,
        country,
        mapValueNameGuest,
        mapValueIndentity,
      ];
}

class UpdateBookingFlightEvent extends ConfirmFlightEvent {
  const UpdateBookingFlightEvent({
    required this.creatAt,
    required this.emailUser,
    required this.passengers,
    required this.totalPrice,
    required this.promoCode,
    required this.nameAirline,
    required this.date,
    required this.uid,
    required this.seats,
    required this.classSeats,
    required this.mapValueNameGuest,
    required this.mapValueIndentity,
  });

  final String creatAt;
  final String emailUser;
  final int passengers;
  final double totalPrice;
  final String promoCode;
  final String nameAirline;
  final String date;
  final String uid;
  final Map<String, String> seats;
  final Map<String, String> classSeats;
  final Map<String, String> mapValueNameGuest;
  final Map<int, String> mapValueIndentity;

  @override
  List<Object> get props => [
        creatAt,
        emailUser,
        passengers,
        totalPrice,
        promoCode,
        nameAirline,
        date,
        seats,
        classSeats,
        mapValueNameGuest,
        mapValueIndentity,
        uid
      ];
}

class DeleteBookingFlightEvent extends ConfirmFlightEvent {
  const DeleteBookingFlightEvent({
    required this.uid,
  });
  final String uid;

  @override
  List<Object> get props => [uid];
}
