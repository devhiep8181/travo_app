part of 'count_react_bloc.dart';

enum CountReactStatus { initial, loaded, error }

extension CountReactStatusX on CountReactStatus {
  bool get isLoaded => [CountReactStatus.loaded].contains(this);
}

class CountReactState extends Equatable {
  const CountReactState({
    required this.countDislike,
    required this.countLike,
    required this.countReactStatus,
    required this.dislike,
    required this.like,
    required this.likeOrDislike,
  });

  final Map<int, int> countLike;
  final Map<int, int> countDislike;
  final Map<int, bool> like;
  final Map<int, bool> dislike;
  final Map<int, bool?> likeOrDislike;
  final CountReactStatus countReactStatus;

  @override
  List<Object> get props =>
      [countLike, countDislike, like, dislike, likeOrDislike];

  CountReactState copyWith({
    Map<int, int>? countLike,
    Map<int, int>? countDislike,
    Map<int, bool>? like,
    Map<int, bool>? dislike,
    Map<int, bool?>? likeOrDislike,
    CountReactStatus? countReactStatus,
  }) {
    return CountReactState(
      countLike: countLike ?? this.countLike,
      countDislike: countDislike ?? this.countDislike,
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
      likeOrDislike: likeOrDislike ?? this.likeOrDislike,
      countReactStatus: countReactStatus ?? this.countReactStatus,
    );
  }
}
