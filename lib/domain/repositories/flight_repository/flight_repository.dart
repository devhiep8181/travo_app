import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/flight_entity.dart';

abstract class FlightRepository {
  Future<Either<Failure, List<FlightEnity>>> getListFlight();

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
  });

  Future<Either<Failure, void>> deleteBookingFlight({required String uid});
}
