import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/booking_flight_entity.dart';

abstract class GetBookingFlightRepository {
  Future<Either<Failure, List<BookingFlightEntity>>> getBookingFlight(
      {required String email});
}
