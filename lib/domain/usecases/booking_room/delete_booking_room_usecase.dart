import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../repositories/booking_room_repository/booking_room_repository.dart';

class DeleteBookingRoomUseCase implements UseCase<void, String> {
  DeleteBookingRoomUseCase({
    required this.bookingRoomRepository,
  });
  final BookingRoomRepository bookingRoomRepository;

  @override
  Future<Either<Failure, void>> call(String params) async{
    return bookingRoomRepository.deleteBookingRoom(uid: params);
  }
}
