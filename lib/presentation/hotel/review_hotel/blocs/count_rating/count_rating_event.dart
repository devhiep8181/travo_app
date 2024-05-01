part of 'count_rating_bloc.dart';

abstract class CountRatingEvent extends Equatable {
  const CountRatingEvent();

  @override
  List<Object> get props => [];
}

class ProcessCountRatingEvent extends CountRatingEvent {
  const ProcessCountRatingEvent({
    required this.rating,
  });
  final int rating;
  

  @override
  List<Object> get props => [rating];
}
