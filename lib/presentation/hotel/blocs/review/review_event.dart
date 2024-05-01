part of 'review_bloc.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class GetReviewEvent extends ReviewEvent {
  const GetReviewEvent({
    required this.hotelId,
    required this.totalReview,
    required this.rating,
  });
  final String hotelId;
  final int? totalReview;
  final double? rating;

  @override
  List<Object> get props => [hotelId];
}

class UpdateReviewEvent extends ReviewEvent {
  const UpdateReviewEvent({
    required this.photo,
    required this.comment,
    required this.rating,
    required this.uid,
    required this.ratedTime,
    required this.likeOrDislike,
  });
  final List<String> photo;
  final String comment;
  final int rating;
  final String uid;
  final String ratedTime;
  final bool? likeOrDislike;

  @override
  List<Object> get props => [photo, comment, rating, uid, ratedTime];
}

class DeleteReviewEvent extends ReviewEvent {
  const DeleteReviewEvent({
    required this.uid,
  });
  final String uid;

  @override
  List<Object> get props => [uid];
}

class PushReviewEvent extends ReviewEvent {
  const PushReviewEvent({
    required this.ratingEntity,
  });
  final RatingEntity ratingEntity;

  @override
  List<Object> get props => [ratingEntity];
}
