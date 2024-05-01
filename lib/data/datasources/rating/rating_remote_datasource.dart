import '../../models/rating_model.dart';

abstract class RatingRemoteDatasource {
  Future<List<RatingModel>> getReview({required String hotelId});

  Future<void> updateReview({required RatingModel ratingModel});

  Future<void> pushReview({required RatingModel ratingModel});

  Future<void> deleteReview({required String uid});
}
