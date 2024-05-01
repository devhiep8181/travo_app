part of 'modify_review_bloc.dart';

abstract class ModifyReviewEvent extends Equatable {
  const ModifyReviewEvent();

  @override
  List<Object> get props => [];
}

class GetModifyRevewEvent extends ModifyReviewEvent {
  const GetModifyRevewEvent({
    required this.rating,
    required this.indexReview,
  });
  final RatingEntity rating;
  final int indexReview;

  @override
  List<Object> get props => [rating, indexReview];
}

class NoModifyReviewEvent extends ModifyReviewEvent {}

class UpdatePhotoReviewEvent extends ModifyReviewEvent {
  const UpdatePhotoReviewEvent({
    required this.photo,
  });
  final String photo;

  @override
  List<Object> get props => [photo];
}

class DeletePhotoReviewEvent extends ModifyReviewEvent {
  const DeletePhotoReviewEvent({
    required this.photo,
  });
  final String photo;

  @override
  List<Object> get props => [photo];
}
