import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/booking_room_repository/booking_room_repository.dart';

class UpdateBookingRoomUseCase implements UseCase<void, UpdateBookingParams> {
  UpdateBookingRoomUseCase({
    required this.bookingRoomRepository,
  });
  final BookingRoomRepository bookingRoomRepository;

  @override
  Future<Either<Failure, void>> call(UpdateBookingParams params) async {
    return bookingRoomRepository.updateBookingRoom(
        creatAt: params.creatAt ?? '',
        checkIn: params.checkIn ?? '',
        checkOut: params.checkOut ?? '',
        emailGuest: params.emailGuest ?? '',
        nameGuest: params.nameGuest ?? '',
        idHotel: params.idHotel ?? '',
        phoneGuest: params.phoneGuest ?? '',
        nameRoom: params.nameRoom ?? '',
        imageRoom: params.imageRoom ?? '',
        uid: params.uid ?? ' ');
  }
}

class UpdateBookingParams extends Equatable {
  const UpdateBookingParams({
    required this.creatAt,
    required this.checkIn,
    required this.checkOut,
    required this.emailGuest,
    required this.nameGuest,
    required this.idHotel,
    required this.phoneGuest,
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

  @override
  List<Object?> get props => [
        creatAt,
        checkIn,
        checkOut,
        emailGuest,
        nameGuest,
        idHotel,
        phoneGuest,
        nameRoom,
        imageRoom,
        uid
      ];
}
