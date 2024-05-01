import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/entities/hotel_entity.dart';
import '../../../domain/repositories/hotel_repository/hotel_reposiory.dart';
import '../../datasources/hotel/hotel_remote_datasource.dart';

class HotelRepositoryImpl implements HotelRepository {
  const HotelRepositoryImpl({
    required this.networkInfo,
    required this.hotelRemoteDataSource,
  });
  final NetworkInfo networkInfo;
  final HotelRemoteDatasoure hotelRemoteDataSource;

  @override
  Future<Either<Failure, List<HotelEntity>>> getHotel() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await hotelRemoteDataSource.getHotel();
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
