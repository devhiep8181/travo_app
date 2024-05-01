import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../repositories/rating_repository/rating_repository.dart';

class DeleteReviewUseCase implements UseCase<void, String> {
  DeleteReviewUseCase({
    required this.ratingRepository,
  });
  final RatingRepository ratingRepository;

  @override
  Future<Either<Failure, void>> call(String params) async {
    return ratingRepository.deleteRating(uid: params);
  }
}
