part of 'review_bloc.dart';

enum ReviewStatus { initial, loading, loaded, error }

extension ReviewStatusX on ReviewStatus {
  bool get isLoaded => [ReviewStatus.loaded].contains(this);
  bool get isLoading => [ReviewStatus.loading].contains(this);
  bool get isError => [ReviewStatus.error].contains(this);
}

class ReviewState extends Equatable {
  const ReviewState({
    required this.idHotel,
    required this.reviewStatus,
    required this.listRating,
    required this.message,
    required this.totalReview,
    required this.rating,
  });

  final ReviewStatus reviewStatus;
  final List<RatingEntity> listRating;
  final String idHotel;
  final String message;
  final int totalReview;
  final double rating;

  @override
  List<Object> get props => [reviewStatus, listRating];

  ReviewState copyWith({
    ReviewStatus? reviewStatus,
    List<RatingEntity>? listRating,
    String? idHotel,
    String? message,
    int? totalReview,
    double? rating,
  }) {
    return ReviewState(
      reviewStatus: reviewStatus ?? this.reviewStatus,
      listRating: listRating ?? this.listRating,
      idHotel: idHotel ?? this.idHotel,
      message: message ?? this.message,
      totalReview: totalReview ?? this.totalReview,
      rating: rating ?? this.rating,
    );
  }
}
