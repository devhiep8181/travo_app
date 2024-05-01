import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/network/network_info.dart';
import '../../../domain/entities/booking_flight_entity.dart';
import '../../../domain/repositories/booking_flight_repository/get_booking_flight_repository.dart';
import '../../datasources/booking_flight/get_booking_flight_remote_datasource.dart';

class GetBookingFlightRepositoryImpl implements GetBookingFlightRepository {
  GetBookingFlightRepositoryImpl({
    required this.networkInfo,
    required this.getBookingFlightRemoteDatasource,
  });
  final NetworkInfo networkInfo;
  final GetBookingFlightRemoteDatasource getBookingFlightRemoteDatasource;

  @override
  Future<Either<Failure, List<BookingFlightEntity>>> getBookingFlight(
      {required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await getBookingFlightRemoteDatasource.getBookingFlight(
            email: email);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
