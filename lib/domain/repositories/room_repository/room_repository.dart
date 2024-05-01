import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/room_entity.dart';

abstract class RoomRepository {
  Future<Either<Failure, List<RoomEntity>>> getRoom({required String hotelId});
}
