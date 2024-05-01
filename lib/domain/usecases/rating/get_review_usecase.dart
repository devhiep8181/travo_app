import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/rating_entity.dart';
import '../../repositories/rating_repository/rating_repository.dart';

class GetReviewUseCase implements UseCase<List<RatingEntity>, String> {
  GetReviewUseCase({
    required this.ratingRepository,
  });
  final RatingRepository ratingRepository;

  @override
  Future<Either<Failure, List<RatingEntity>>> call(String params) async {
    return ratingRepository.getRating(hotelId: params);
  }
}
