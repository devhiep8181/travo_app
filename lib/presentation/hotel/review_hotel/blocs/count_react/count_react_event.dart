part of 'count_react_bloc.dart';

abstract class CountReactEvent extends Equatable {
  const CountReactEvent();

  @override
  List<Object> get props => [];
}

class CountReactLikeEvent extends CountReactEvent {
  const CountReactLikeEvent({
    required this.countLike,
    required this.like,
    required this.countDisLike,
    required this.index,
    required this.uid,
  });
  final int countLike;
  final int countDisLike;
  final bool like;
  final int index;
  final String uid;

  @override
  List<Object> get props => [countLike, like, countDisLike, index, uid];
}

class CountReactDisLikeEvent extends CountReactEvent {
  const CountReactDisLikeEvent({
    required this.countDislike,
    required this.disLike,
    required this.countLike,
    required this.index,
    required this.uid,
  });
  final int countDislike;
  final bool disLike;
  final int countLike;
  final int index;
  final String uid;

  @override
  List<Object> get props => [countDislike, disLike, countLike, index, uid];
}

class InitialCountReactEvent extends CountReactEvent {
  const InitialCountReactEvent({
    required this.index,
    required this.value,
    required this.countDislike,
    required this.countLike,
  });
  final int index;
  final bool? value;
  final int countDislike;
  final int countLike;

  @override
  List<Object> get props => [index, countDislike, countLike];
}
