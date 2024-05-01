import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/booking_entity.dart';

class BookingModel extends BookingEntity {
  const BookingModel(
      {required super.creatAt,
      required super.checkIn,
      required super.checkOut,
      required super.emailUser,
      required super.emailGuest,
      required super.nameGuest,
      required super.phoneGuest,
      required super.idHotel,
      required super.nameRoom,
      required super.numberCard,
      required super.expDate,
      required super.cvv,
      required super.country,
      required super.imageRoom,
      required super.typePayment, required super.uidRoomBooking});

  factory BookingModel.fromFirestore(DocumentSnapshot doc) {
    final emailGuest =
        (doc['Guest'] as Map<String, dynamic>)['email']?.toString() ?? '';
    final nameGuest =
        (doc['Guest'] as Map<String, dynamic>)['name']?.toString() ?? '';
    final phoneGuest =
        (doc['Guest'] as Map<String, dynamic>)['phone']?.toString() ?? '';
    final numberCard = (doc['Card'] as Map<String, dynamic>)['number card']?.toString() ?? '';
    final country = (doc['Card'] as Map<String, dynamic>)['country']?.toString() ?? '';
    final cvv = (doc['Card'] as Map<String, dynamic>)['cvv']?.toString() ?? '';
    final expDate = (doc['Card'] as Map<String, dynamic>)['exp date']?.toString() ?? '';
    return BookingModel(
      creatAt: doc['Create At']?.toString() ?? '',
      checkIn: doc['Check-in']?.toString() ?? '',
      checkOut: doc['Check-out']?.toString() ?? '',
      emailUser: doc['Email']?.toString() ?? '',
      emailGuest: emailGuest,
      nameGuest: nameGuest,
      phoneGuest: phoneGuest,
      idHotel: doc['Hotel']?.toString() ?? '',
      nameRoom: doc['Room']?.toString() ?? '',
      numberCard: numberCard,
      expDate: expDate,
      cvv: cvv,
      country: country,
      imageRoom: doc['Image']?.toString() ?? '',
      typePayment: doc['Type Payment']?.toString() ?? '',
      uidRoomBooking: doc['Uid Room Booking']?.toString() ?? '',
    );
  }
}
