import '../../models/booking_model.dart';

abstract class BookingRoomRemoteDataSource {
  Future<List<BookingModel>> getBookingRoom({required String email});

  Future<void> updateBookingRoom({
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

  Future<void> deleteBookingRoom({required String uid});
}
