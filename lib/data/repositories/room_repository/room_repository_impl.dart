import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/entities/room_entity.dart';
import '../../../domain/repositories/room_repository/room_repository.dart';
import '../../datasources/room/room_remote_datasoure.dart';

class RoomRepositoryImpl implements RoomRepository {
  RoomRepositoryImpl({
    required this.roomRemoteDataSource,
    required this.networkInfo,
  });
  final RoomRemoteDataSource roomRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<RoomEntity>>> getRoom({required String hotelId}) async{
      if (await networkInfo.isConnected) {
      try {
        final result = await roomRemoteDataSource.getRoom(hotelId: hotelId);
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
