import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/booking_entity.dart';
import '../../repositories/booking_room_repository/booking_room_repository.dart';

class GetBookingRoomUsecase implements UseCase<List<BookingEntity>, String> {
  GetBookingRoomUsecase({
    required this.bookingRoomRepository,
  });
  BookingRoomRepository bookingRoomRepository;

  @override
  Future<Either<Failure, List<BookingEntity>>> call(String params) async {

    return bookingRoomRepository.getBookingRoom(email: params);
  }
}
