import '../../../core/app_export.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/rating_model.dart';
import 'rating_remote_datasource.dart';

class RatingRemoteDatasourceImpl implements RatingRemoteDatasource {
  RatingRemoteDatasourceImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<void> deleteReview({required String uid}) async {
    await baseRemoteDatasource.deleteBooking(
        uid: uid, collectionName: TextConstant.ratingCollection);
  }

  @override
  Future<void> pushReview({required RatingModel ratingModel}) async {
    await baseRemoteDatasource.addReviewHotel(
      comment: ratingModel.comment,
      hotelId: ratingModel.hotelId,
      photos: ratingModel.photos as List<String>?,
      ratedTime: ratingModel.ratedTime,
      rating: ratingModel.rating,
      emailUser: ratingModel.emailUser,
      countlike: ratingModel.countlike,
      countDislike: ratingModel.countDislike,
      uid: ratingModel.uid,
    );
  }

  @override
  Future<void> updateReview({required RatingModel ratingModel}) async {
    await baseRemoteDatasource.updateReviewHotel(
      comment: ratingModel.comment,
      hotelId: ratingModel.hotelId,
      photos: ratingModel.photos as List<String>?,
      ratedTime: ratingModel.ratedTime,
      rating: ratingModel.rating,
      emailUser: ratingModel.emailUser,
      countlike: ratingModel.countlike,
      countDislike: ratingModel.countDislike,
      uid: ratingModel.uid,
     
    );
  }

  @override
  Future<List<RatingModel>> getReview({required String hotelId}) async {
    final listReview = await baseRemoteDatasource.getData(
        collectionName: TextConstant.ratingCollection,
        fromFirestore: RatingModel.fromFirestore);
    final listReviewResult =
        listReview.where((element) => element.hotelId == hotelId).toList();
    return listReviewResult;
  }
}
