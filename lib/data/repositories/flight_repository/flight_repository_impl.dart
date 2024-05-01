import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/network/network_info.dart';
import '../../../domain/entities/flight_entity.dart';
import '../../../domain/repositories/flight_repository/flight_repository.dart';
import '../../datasources/flight/flight_remote_datasoure.dart';

class FlightRepositoryImpl implements FlightRepository {
  FlightRepositoryImpl({
    required this.networkInfo,
    required this.flightRemoteDatasource,
  });
  final NetworkInfo networkInfo;
  final FlightRemoteDatasource flightRemoteDatasource;

  @override
  Future<Either<Failure, List<FlightEnity>>> getListFlight() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await flightRemoteDatasource.getFlight();
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateBookingFlight({
    required String creatAt,
    required String emailUser,
    required int passengers,
    required double totalPrice,
    required String promoCode,
    required List<String> nameGuest,
    required String nameAirline,
    required List<String> seats,
    required List<String> classSeats,
    required String date,
    required String uid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await flightRemoteDatasource.updateBookingFlight(
            creatAt: creatAt,
            emailUser: emailUser,
            passengers: passengers,
            totalPrice: totalPrice,
            promoCode: promoCode,
            nameGuest: nameGuest,
            nameAirline: nameAirline,
            seats: seats,
            classSeats: classSeats,
            date: date,
            uid: uid);
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteBookingFlight({required String uid}) async{
      if (await networkInfo.isConnected) {
      try {
        await flightRemoteDatasource.deleteBookingFlight(uid: uid);
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
