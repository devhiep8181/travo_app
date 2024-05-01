import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_rating_event.dart';
part 'count_rating_state.dart';

class CountRatingBloc extends Bloc<CountRatingEvent, CountRatingState> {
  CountRatingBloc()
      : super(const CountRatingState(
            rating: 0, countRatingStatus: CountRatingStatus.initial)) {
    on<ProcessCountRatingEvent>(_onProcessCountRatingEvent);
  }

  FutureOr<void> _onProcessCountRatingEvent(
      ProcessCountRatingEvent event, Emitter<CountRatingState> emit) {
    try {
      emit(state.copyWith(
          rating: event.rating, countRatingStatus: CountRatingStatus.loaded));
    } catch (e) {
      emit(state.copyWith(countRatingStatus: CountRatingStatus.error));
    }
  }
}
