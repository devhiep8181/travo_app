import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/booking_flight_entity.dart';

abstract class BookingFlightRepository {
  Future<Either<Failure, void>> pushBookingFlight(BookingFlightEntity bookingFlightEntity);
}
