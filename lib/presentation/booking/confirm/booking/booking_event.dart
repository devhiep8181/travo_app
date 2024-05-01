part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class ProcessBookingEvent extends BookingEvent {
  const ProcessBookingEvent({
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

  @override
  List<Object> get props => [];
}

class GetBookingEvent extends BookingEvent {
  const GetBookingEvent({
    required this.email,
  });
  final String email;
}

class EditBookingRoomEvent extends BookingEvent {
  const EditBookingRoomEvent({
    required this.creatAt,
    required this.checkIn,
    required this.checkOut,
    required this.emailGuest,
    required this.nameGuest,
    required this.phoneGuest,
    required this.idHotel,
    required this.nameRoom,
    required this.imageRoom,
    required this.uid,
  });
  final String? creatAt;
  final String? checkIn;
  final String? checkOut;
  final String? emailGuest;
  final String? nameGuest;
  final String? idHotel;
  final String? phoneGuest;
  final String? nameRoom;
  final String? imageRoom;
  final String? uid;
}

class DeleteBookingRoomEvent extends BookingEvent {
  const DeleteBookingRoomEvent({
    required this.uid,
  });
  final String uid;

  @override
  List<Object> get props => [uid];
}
