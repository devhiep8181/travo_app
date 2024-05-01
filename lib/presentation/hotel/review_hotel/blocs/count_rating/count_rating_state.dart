part of 'count_rating_bloc.dart';

enum CountRatingStatus { initial, loaded, error }

extension CountRatingStatusX on CountRatingStatus {
  bool get isLoaded => [CountRatingStatus.loaded].contains(this);
}

class CountRatingState extends Equatable {
  const CountRatingState({
    required this.rating,
    required this.countRatingStatus,
  });
  final int rating;
  final CountRatingStatus countRatingStatus;
  @override
  List<Object> get props => [rating, countRatingStatus];

  CountRatingState copyWith({
    int? rating,
    CountRatingStatus? countRatingStatus,
  }) {
    return CountRatingState(
      rating: rating ?? this.rating,
      countRatingStatus: countRatingStatus ?? this.countRatingStatus,
    );
  }
}
