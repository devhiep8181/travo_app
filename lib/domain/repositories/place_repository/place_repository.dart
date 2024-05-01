// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../core/errors/failures.dart';
import '../../entities/place_entity.dart';

abstract class PlaceRepository {
  Future<Either<Failure, List<PlaceEntity>>> getPlace();
}
