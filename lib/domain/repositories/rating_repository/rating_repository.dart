import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/rating_entity.dart';

abstract class RatingRepository {
  Future<Either<Failure, List<RatingEntity>>> getRating({required String hotelId});

  Future<Either<Failure, void>> updateRating(
      {required RatingEntity ratingEntity});

  Future<Either<Failure, void>> deleteRating({required String uid});

  Future<Either<Failure, void>> pushRating(
      {required RatingEntity ratingEntity});
}
