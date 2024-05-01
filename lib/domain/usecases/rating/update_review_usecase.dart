import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/rating_entity.dart';
import '../../repositories/rating_repository/rating_repository.dart';

class UpdateReviewUseCase implements UseCase<void, RatingEntity> {
  UpdateReviewUseCase({
    required this.ratingRepository,
  });
  final RatingRepository ratingRepository;

  @override
  Future<Either<Failure, void>> call(RatingEntity params) async {
    return ratingRepository.updateRating(
        ratingEntity: RatingEntity(
      comment: params.comment,
      hotelId: params.hotelId,
      photos: params.photos,
      ratedTime: params.ratedTime,
      rating: params.rating,
      emailUser: params.emailUser,
      countlike: params.countlike,
      countDislike: params.countDislike,
      uid: params.uid,
    ));
  }
}
