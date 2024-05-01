import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/entities/rating_entity.dart';
import '../../../domain/repositories/rating_repository/rating_repository.dart';
import '../../datasources/rating/rating_remote_datasource.dart';
import '../../models/rating_model.dart';

class RatingRepositoryImpl implements RatingRepository {
  RatingRepositoryImpl({
    required this.networkInfo,
    required this.ratingRemoteDatasource,
  });
  final NetworkInfo networkInfo;
  final RatingRemoteDatasource ratingRemoteDatasource;

  @override
  Future<Either<Failure, void>> deleteRating({required String uid}) async {
    if (await networkInfo.isConnected) {
      try {
        await ratingRemoteDatasource.deleteReview(uid: uid);
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<RatingEntity>>> getRating(
      {required String hotelId}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await ratingRemoteDatasource.getReview(hotelId: hotelId);
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> pushRating(
      {required RatingEntity ratingEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        await ratingRemoteDatasource.pushReview(
            ratingModel: RatingModel(
          comment: ratingEntity.comment,
          hotelId: ratingEntity.hotelId,
          photos: ratingEntity.photos,
          ratedTime: ratingEntity.ratedTime,
          rating: ratingEntity.rating,
          emailUser: ratingEntity.emailUser,
          countlike: ratingEntity.countlike,
          countDislike: ratingEntity.countDislike,
          uid: ratingEntity.uid,
        ));
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateRating(
      {required RatingEntity ratingEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        await ratingRemoteDatasource.updateReview(
            ratingModel: RatingModel(
          comment: ratingEntity.comment,
          hotelId: ratingEntity.hotelId,
          photos: ratingEntity.photos,
          ratedTime: ratingEntity.ratedTime,
          rating: ratingEntity.rating,
          emailUser: ratingEntity.emailUser,
          countlike: ratingEntity.countlike,
          countDislike: ratingEntity.countDislike,
          uid: ratingEntity.uid,
        ));
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
