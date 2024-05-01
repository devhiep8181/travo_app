import 'dart:convert';

import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  factory BookingEntity.fromJson(String source) =>
      BookingEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  factory BookingEntity.fromMap(Map<String, dynamic> map) {
    return BookingEntity(
      creatAt: map['creatAt']?.toString() ?? '',
      checkIn: map['checkIn']?.toString() ?? '',
      checkOut: map['checkOut']?.toString(),
      emailUser: map['emailUser']?.toString(),
      emailGuest: map['emailGuest']?.toString(),
      nameGuest: map['nameGuest']?.toString(),
      phoneGuest: map['phoneGuest']?.toString(),
      idHotel: map['idHotel']?.toString(),
      nameRoom: map['nameRoom']?.toString(),
      numberCard: map['numberCard']?.toString(),
      expDate: map['expDate']?.toString(),
      cvv: map['cvv']?.toString(),
      country: map['country']?.toString(),
      imageRoom: map['imageRoom']?.toString(),
      typePayment: map['typePayment']?.toString(),
      uidRoomBooking: map['uidRoomBooking'].toString(),
    );
  }
  const BookingEntity({
    required this.creatAt,
    required this.checkIn,
    required this.checkOut,
    required this.emailUser,
    required this.emailGuest,
    required this.nameGuest,
    required this.phoneGuest,
    required this.idHotel,
    required this.nameRoom,
    required this.numberCard,
    required this.expDate,
    required this.cvv,
    required this.country,
    required this.imageRoom,
    required this.typePayment,
    required this.uidRoomBooking,
  });

  final String? creatAt;
  final String? checkIn;
  final String? checkOut;
  final String? emailUser;
  final String? emailGuest;
  final String? nameGuest;
  final String? phoneGuest;
  final String? idHotel;
  final String? nameRoom;
  final String? numberCard;
  final String? expDate;
  final String? cvv;
  final String? country;
  final String? imageRoom;
  final String? typePayment;
  final String uidRoomBooking;

  @override
  List<Object?> get props => [
        creatAt,
        checkIn,
        checkOut,
        emailUser,
        emailGuest,
        nameGuest,
        phoneGuest,
        idHotel,
        nameRoom,
        numberCard,
        expDate,
        cvv,
        country,
        imageRoom,
        typePayment,
        uidRoomBooking,
      ];

  Map<String, dynamic> toMap() {
    return {
      'creatAt': creatAt,
      'checkIn': checkIn,
      'checkOut': checkOut,
      'emailUser': emailUser,
      'emailGuest': emailGuest,
      'nameGuest': nameGuest,
      'phoneGuest': phoneGuest,
      'idHotel': idHotel,
      'nameRoom': nameRoom,
      'numberCard': numberCard,
      'expDate': expDate,
      'cvv': cvv,
      'country': country,
      'imageRoom': imageRoom,
      'typePayment': typePayment,
      'uid' : uidRoomBooking,
    };
  }

  String toJson() => json.encode(toMap());
}
