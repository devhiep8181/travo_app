import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/entities/booking_entity.dart';
import '../../../domain/repositories/booking_room_repository/booking_room_repository.dart';
import '../../datasources/booking_room/booking_room_remote_datasource.dart';

class BookingRoomRepositoryImpl implements BookingRoomRepository {
  BookingRoomRepositoryImpl({
    required this.networkInfo,
    required this.bookingRoomRemoteDataSource,
  });
  final NetworkInfo networkInfo;
  final BookingRoomRemoteDataSource bookingRoomRemoteDataSource;

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookingRoom(
      {required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await bookingRoomRemoteDataSource.getBookingRoom(email: email);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateBookingRoom(
      {required String creatAt,
      required String checkIn,
      required String checkOut,
      required String emailGuest,
      required String nameGuest,
      required String idHotel,
      required String phoneGuest,
      required String nameRoom,
      required String imageRoom,
      required String uid}) async {
    if (await networkInfo.isConnected) {
      try {
        await bookingRoomRemoteDataSource.updateBookingRoom(
            creatAt: creatAt,
            checkIn: checkIn,
            checkOut: checkOut,
            emailGuest: emailGuest,
            nameGuest: nameGuest,
            idHotel: idHotel,
            phoneGuest: phoneGuest,
            nameRoom: nameRoom,
            imageRoom: imageRoom,
            uid: uid);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteBookingRoom({required String uid}) async {
    if (await networkInfo.isConnected) {
      try {
        await bookingRoomRemoteDataSource.deleteBookingRoom(uid: uid);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
