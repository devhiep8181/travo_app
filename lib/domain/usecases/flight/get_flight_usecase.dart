import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/flight_entity.dart';
import '../../repositories/flight_repository/flight_repository.dart';

class GetFlightUseCase implements UseCase<List<FlightEnity>, NoParams> {
  GetFlightUseCase({
    required this.flightRepository,
  });
  final FlightRepository flightRepository;

  @override
  Future<Either<Failure, List<FlightEnity>>> call(NoParams params) async{
    return flightRepository.getListFlight();
  }
}
