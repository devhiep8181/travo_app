import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/booking_flight_entity.dart';

class BookingFlightModel extends BookingFlightEntity {
  const BookingFlightModel({
    super.classSeats,
    super.country,
    super.creatAt,
    super.cvv,
    super.date,
    super.emailUser,
    super.expDate,
    super.nameAirline,
    super.nameGuest,
    super.numberCard,
    super.passengers,
    super.promoCode,
    super.seats,
    super.totalPrice,
    super.typePayment,
    super.uidBookingFlight,
  });

  factory BookingFlightModel.fromFirestore(DocumentSnapshot doc) {
    final numberCard =
        (doc['Card'] as Map<String, dynamic>)['number card']?.toString() ?? '';
    final country =
        (doc['Card'] as Map<String, dynamic>)['country']?.toString() ?? '';
    final cvv = (doc['Card'] as Map<String, dynamic>)['cvv']?.toString() ?? '';
    final expDate =
        (doc['Card'] as Map<String, dynamic>)['exp date']?.toString() ?? '';

    final nameGuest =
        _extractGuestName(doc['Guest'] as List<dynamic>);

    final seats = _extractSeats(doc['Guest'] as List<dynamic>);
    final classSeats =
        _extractClassSeats(doc['Guest'] as List<dynamic>);

    return BookingFlightModel(
      creatAt: doc['Create At']?.toString() ?? '',
      classSeats: classSeats,
      emailUser: doc['Email']?.toString() ?? '',
      passengers: doc['Passengers'] as int,
      totalPrice: doc['Total Price'] as double,
      promoCode: doc['Promo Code']?.toString() ?? '',
      nameAirline: doc['Arrive']?.toString() ?? '',
      nameGuest: nameGuest,
      seats: seats,
      date: doc['Date']?.toString() ?? '',
      typePayment: doc['Type Payment']?.toString() ?? '',
      numberCard: numberCard,
      expDate: expDate,
      cvv: cvv,
      country: country,
      uidBookingFlight: doc['Uid Booking Flight']?.toString() ?? '',
    );
  }

  static List<String> _extractGuestName(List<dynamic> guestData) {
    return guestData.map((guest) => guest['name']?.toString() ?? '').toList();
  }

  static List<String> _extractSeats(List<dynamic> guestData) {
    return guestData.map((guest) => guest['seat']?.toString() ?? '').toList();
  }

  static List<String> _extractClassSeats(List<dynamic> guestData) {
    return guestData
        .map((guest) => guest['classSeat']?.toString() ?? '')
        .toList();
  }
}
