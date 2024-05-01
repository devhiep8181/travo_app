import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRemoteDatasource {
  Future<void> createUserWithEmail({
    required String email,
    required String password,
    required String name,
    required String countryName,
    required String phoneNumber,
    required String image,
  });

  Future<dynamic> getUser({required String email});

  Future<dynamic> signInUserWithEmail(
      {required String email, required String password});

  Future<void> addBooking({
    required String creatAt,
    required String checkIn,
    required String checkOut,
    required String emailUser,
    required String emailGuest,
    required String nameGuest,
    required String phoneGuest,
    required String idHotel,
    required String nameRoom,
    required String numberCard,
    required String expDate,
    required String cvv,
    required String country,
    required String imagePath,
    required String typePayment,
    required String uid,
  });

  Future<List<T>> getDataWithEmail<T>(
      {required String collectionName,
      required String email,
      required T Function(DocumentSnapshot) fromFirestore});

  Future<List<T>> getData<T>(
      {required String collectionName,
      required T Function(DocumentSnapshot) fromFirestore});

  Future<void> updateBooking({
    required String creatAt,
    required String checkIn,
    required String checkOut,
    required String emailGuest,
    required String nameGuest,
    required String idHotel,
    required String phoneGuest,
    required String nameRoom,
    required String imageRoom,
    required String uid,
  });

  Future<void> updateBookingFlight({
    required String creatAt,
    required String emailUser,
    required int passengers,
    required double totalPrice,
    required String promoCode,
    required List<String> nameGuest,
    required String nameAirline,
    required List<String> seats,
    required List<String> classSeats,
    required String date,
    required String uid,
  });

  Future<void> updateReactReviewHotel(
      {required String uid,
      required int like,
      required int dislike,
     });

  Future<void> addBookingFlight({
    required String creatAt,
    required String emailUser,
    required int passengers,
    required double totalPrice,
    required String promoCode,
    required List<String> nameGuest,
    required String nameAirline,
    required List<String> seats,
    required List<String> classSeats,
    required String date,
    required String typePayment,
    required String numberCard,
    required String expDate,
    required String cvv,
    required String country,
    required String uid,
  });

  Future<void> addReviewHotel({
    required String? comment,
    required String? hotelId,
    required List<String>? photos,
    required String? ratedTime,
    required int? rating,
    required String? emailUser,
    required int? countlike,
    required int? countDislike,
    required String uid,
  });

  Future<void> updateReviewHotel({
    required String? comment,
    required String? hotelId,
    required List<String>? photos,
    required String? ratedTime,
    required int? rating,
    required String? emailUser,
    required int? countlike,
    required int? countDislike,
    required String uid,
  });

  Future<void> addReactReviewHotel(
      {required String email, required String uid, required bool? valueReact});

  Future<void> updateValueReactReviewHotel(
      {required String email, required String uid, required bool? valueReact});

  Future<bool?> getValueReactReviewHotel(
      {required String email, required String uid});

  Future<void> deleteReact({required String email, required String uid});

  Future<void> deleteBooking(
      {required String uid, required String collectionName});
}
