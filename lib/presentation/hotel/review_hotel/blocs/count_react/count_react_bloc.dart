import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../configs/cache/user_singleton.dart';
import '../../../../../domain/usecases/action_react/push_value_react_usecase.dart';
import '../../../../../domain/usecases/rating/update_react_usecase.dart';

part 'count_react_event.dart';
part 'count_react_state.dart';

class CountReactBloc extends Bloc<CountReactEvent, CountReactState> {
  CountReactBloc(
      {required this.updateReactUseCase, required this.pushValueReactUseCase})
      : super(const CountReactState(
            likeOrDislike: {},
            countDislike: {},
            countLike: {},
            countReactStatus: CountReactStatus.initial,
            dislike: {},
            like: {})) {
    on<CountReactLikeEvent>(_onCountReactLikeEvent);
    on<CountReactDisLikeEvent>(_onCountReactDisLikeEvent);
    on<InitialCountReactEvent>(_onInitialCountReactEvent);
  }
  final UpdateReactUseCase updateReactUseCase;
  final PushValueReactUseCase pushValueReactUseCase;
  FutureOr<void> _onCountReactLikeEvent(
      CountReactLikeEvent event, Emitter<CountReactState> emit) async {
    var countLike = event.countLike;
    final mapLike = Map<int, bool>.from(state.like);
    final mapDislike = Map<int, bool>.from(state.dislike);
    final mapCountLike = Map<int, int>.from(state.countLike);
    final mapCountDislike = Map<int, int>.from(state.countDislike);
    final mapLikeOrDislike = Map<int, bool?>.from(state.likeOrDislike);
    if (event.like) {
      countLike++;
    } else {
      countLike--;
    }
    mapCountLike[event.index] = countLike;
    mapCountDislike[event.index] = event.countDisLike;
    mapLike[event.index] = event.like;
    mapDislike[event.index] = false;
    if (event.like) {
      mapLikeOrDislike[event.index] = true;
    } else {
      mapLikeOrDislike[event.index] = null;
    }

    await updateReactUseCase(ReactPramas(
        uid: event.uid,
        like: countLike,
        dislike: event.countDisLike));

    await pushValueReactUseCase(PushValueReactParams(
        uid: event.uid,
        email: UserSingleton().email,
        valueReact: mapLikeOrDislike[event.index]));
    emit(state.copyWith(
        likeOrDislike: mapLikeOrDislike,
        countLike: mapCountLike,
        like: mapLike,
        countDislike: mapCountDislike,
        dislike: mapDislike,
        countReactStatus: CountReactStatus.loaded));
  }

  FutureOr<void> _onCountReactDisLikeEvent(
      CountReactDisLikeEvent event, Emitter<CountReactState> emit) async {
    var countDislike = event.countDislike;
    final mapLike = Map<int, bool>.from(state.like);
    final mapDislike = Map<int, bool>.from(state.dislike);
    final mapCountLike = Map<int, int>.from(state.countLike);
    final mapCountDislike = Map<int, int>.from(state.countDislike);
    final mapLikeOrDislike = Map<int, bool?>.from(state.likeOrDislike);

    if (event.disLike) {
      countDislike++;
    } else {
      countDislike--;
    }
    mapCountLike[event.index] = event.countLike;
    mapCountDislike[event.index] = countDislike;
    mapLike[event.index] = false;
    mapDislike[event.index] = event.disLike;

    if (event.disLike) {
      mapLikeOrDislike[event.index] = false;
    } else {
      mapLikeOrDislike[event.index] = null;
    }
    await updateReactUseCase(ReactPramas(
        uid: event.uid,
        like: event.countLike,
        dislike: countDislike));

    await pushValueReactUseCase(PushValueReactParams(
        uid: event.uid,
        email: UserSingleton().email,
        valueReact: mapLikeOrDislike[event.index]));

    emit(state.copyWith(
        likeOrDislike: mapLikeOrDislike,
        countDislike: mapCountDislike,
        dislike: mapDislike,
        countLike: mapCountLike,
        like: mapLike,
        countReactStatus: CountReactStatus.loaded));
  }

  FutureOr<void> _onInitialCountReactEvent(
      InitialCountReactEvent event, Emitter<CountReactState> emit) {
    try {
      final mapLikeOrDislike = Map<int, bool?>.from(state.likeOrDislike);
      bool like;
      bool dislike;
      if (event.value == null) {
        like = false;
        dislike = false;
      } else if (event.value == true) {
        like = true;
        dislike = false;
        mapLikeOrDislike[event.index] = true;
      } else {
        like = false;
        dislike = true;
        mapLikeOrDislike[event.index] = false;
      }
      final mapLike = Map<int, bool>.from(state.like)
        ..addEntries({event.index: like}.entries);
      final mapDislike = Map<int, bool>.from(state.dislike)
        ..addEntries({event.index: dislike}.entries);
      final mapCountLike = Map<int, int>.from(state.countLike)
        ..addEntries({event.index: event.countLike}.entries);
      final mapCountDislike = Map<int, int>.from(state.countDislike)
        ..addEntries({event.index: event.countDislike}.entries);

      emit(state.copyWith(
        countDislike: mapCountDislike,
        countLike: mapCountLike,
        like: mapLike,
        dislike: mapDislike,
        likeOrDislike: mapLikeOrDislike,
        countReactStatus: CountReactStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(countReactStatus: CountReactStatus.error));
    }
  }
}
