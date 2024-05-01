import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/booking_entity.dart';

abstract class BookingRoomRepository {
  Future<Either<Failure, List<BookingEntity>>> getBookingRoom(
      {required String email});

  Future<Either<Failure, void>> updateBookingRoom({
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

  Future<Either<Failure, void>> deleteBookingRoom({required String uid});
}
