import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../repositories/flight_repository/flight_repository.dart';

class DeleteBookingFlightUseCase implements UseCase<void, String> {
  DeleteBookingFlightUseCase({
    required this.flightRepository,
  });
  final FlightRepository flightRepository;

  @override
  Future<Either<Failure, void>> call(String params) async {
    return flightRepository.deleteBookingFlight(uid: params);
  }
}
