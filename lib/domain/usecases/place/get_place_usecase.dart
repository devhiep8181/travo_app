// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/place_entity.dart';
import '../../repositories/place_repository/place_repository.dart';

class GetPlaceUseCase implements UseCase<List<PlaceEntity>, NoParams> {
  GetPlaceUseCase({
    required this.placeRepository,
  });
  final PlaceRepository placeRepository;

  @override
  Future<Either<Failure, List<PlaceEntity>>> call(NoParams params) async {
    return placeRepository.getPlace();
  }
}
