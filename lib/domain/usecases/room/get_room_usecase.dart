import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/room_entity.dart';
import '../../repositories/room_repository/room_repository.dart';

class GetRoomUseCase implements UseCase<List<RoomEntity>, HotelIdParams> {
  GetRoomUseCase({
    required this.roomRepository,
  });
  final RoomRepository roomRepository;
  @override
  Future<Either<Failure, List<RoomEntity>>> call(HotelIdParams hotel) async {
    return roomRepository.getRoom(hotelId: hotel.hotelId);
  }
}


class HotelIdParams extends Equatable{
  const HotelIdParams({
    required this.hotelId,
  });
  final String hotelId;

  @override
  List<Object?> get props => [hotelId];
}
