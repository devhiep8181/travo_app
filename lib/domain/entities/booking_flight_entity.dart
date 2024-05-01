import 'package:equatable/equatable.dart';

class BookingFlightEntity extends Equatable {
  const BookingFlightEntity({
    this.creatAt,
    this.emailUser,
    this.passengers,
    this.totalPrice,
    this.promoCode,
    this.nameGuest,
    this.nameAirline,
    this.seats,
    this.classSeats,
    this.date,
    this.typePayment,
    this.numberCard,
    this.expDate,
    this.cvv,
    this.country,
    this.uidBookingFlight,
  });
  final String? creatAt;
  final String? emailUser;
  final int? passengers;
  final double? totalPrice;
  final String? promoCode;
  final List<String>? nameGuest;
  final String? nameAirline;
  final List<String>? seats;
  final List<String>? classSeats;
  final String? date;
  final String? typePayment;
  final String? numberCard;
  final String? expDate;
  final String? cvv;
  final String? country;
  final String? uidBookingFlight;
  @override
  List<Object?> get props => [
        creatAt,
        emailUser,
        passengers,
        totalPrice,
        promoCode,
        nameGuest,
        nameAirline,
        seats,
        classSeats,
        date,
        typePayment,
        numberCard,
        expDate,
        cvv,
        country,
        uidBookingFlight,
      ];
}
