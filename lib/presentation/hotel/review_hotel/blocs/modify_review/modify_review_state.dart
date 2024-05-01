part of 'modify_review_bloc.dart';

enum ModifyReviewStatus { initial, loading, loaded, error }

extension ModifyReviewStatusX on ModifyReviewStatus {
  bool get isLoaded => [ModifyReviewStatus.loaded].contains(this);
}

class ModifyReviewState extends Equatable {
  const ModifyReviewState({
    required this.rating,
    required this.modifyReviewStatus,
    required this.modify,
    required this.photos,
    required  this.indexReview,
  });

  final RatingEntity rating;
  final bool modify;
  final ModifyReviewStatus modifyReviewStatus;
  final List<String> photos;
  final int indexReview;

  @override
  List<Object> get props => [rating, modify, modifyReviewStatus, photos, indexReview];

  ModifyReviewState copyWith({
    RatingEntity? rating,
    bool? modify,
    ModifyReviewStatus? modifyReviewStatus,
    List<String>? photos,
    int? indexReview,
  }) {
    return ModifyReviewState(
      rating: rating ?? this.rating,
      modify: modify ?? this.modify,
      modifyReviewStatus: modifyReviewStatus ?? this.modifyReviewStatus,
      photos: photos ?? this.photos,
      indexReview: indexReview ?? this.indexReview,
    );
  }
}
