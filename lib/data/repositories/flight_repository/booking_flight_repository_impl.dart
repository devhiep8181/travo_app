
import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/network/network_info.dart';
import '../../../domain/entities/booking_flight_entity.dart';
import '../../../domain/repositories/flight_repository/booking_flight_repository.dart';
import '../../datasources/flight/booking_flight_datasource.dart';
import '../../models/booking_flight_model.dart';

class BookingFlightRepositoryImpl implements BookingFlightRepository {
  BookingFlightRepositoryImpl({
    required this.networkInfo,
    required this.bookingFlightDatasource,
  });
  final NetworkInfo networkInfo;
  final BookingFlightDatasource bookingFlightDatasource;

  @override
  Future<Either<Failure, void>> pushBookingFlight(
      BookingFlightEntity bookingFlightEntity) async {
    if (await networkInfo.isConnected) {
      try {
        await bookingFlightDatasource.pushBookingFlight(BookingFlightModel(
            creatAt: bookingFlightEntity.creatAt,
            emailUser: bookingFlightEntity.emailUser,
            passengers: bookingFlightEntity.passengers,
            totalPrice: bookingFlightEntity.totalPrice,
            promoCode: bookingFlightEntity.promoCode,
            nameGuest: bookingFlightEntity.nameGuest,
            nameAirline: bookingFlightEntity.nameAirline,
            seats: bookingFlightEntity.seats,
            classSeats: bookingFlightEntity.classSeats,
            date: bookingFlightEntity.date,
            typePayment: bookingFlightEntity.typePayment,
            numberCard: bookingFlightEntity.numberCard,
            expDate: bookingFlightEntity.expDate,
            cvv: bookingFlightEntity.cvv,
            country: bookingFlightEntity.country,
            uidBookingFlight: bookingFlightEntity.uidBookingFlight,
            ));
        return const Right(null); //không trả về gì cả
      } on ServerFailure catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
