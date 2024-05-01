import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/booking_flight_entity.dart';
import '../../repositories/booking_flight_repository/get_booking_flight_repository.dart';

class GetBookingFlightUseCase
    implements UseCase<List<BookingFlightEntity>, String> {
  GetBookingFlightUseCase({required this.getBookingFlightRepository});
  final GetBookingFlightRepository getBookingFlightRepository;

  @override
  Future<Either<Failure, List<BookingFlightEntity>>> call(String params) async {
    return getBookingFlightRepository.getBookingFlight(email: params);
  }
}
