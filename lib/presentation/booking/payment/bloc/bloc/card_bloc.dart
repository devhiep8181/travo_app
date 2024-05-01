

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc()
      : super(const CardState(
            cVV: '',
            cardNumber: '',
            cardStatus: CardStatus.initial,
            countryName: '',
            expDate: '',
            name: '')) {
    on<GetCardEvent>(_onGetCardEvent);
  }

  void _onGetCardEvent(GetCardEvent event, Emitter<CardState> emit) {
    try {
      emit(state.copyWith(
          cardStatus: CardStatus.loaded,
          name: event.name,
          cardNumber: event.cardNumber,
          expDate: event.expDate,
          cVV: event.cVV,
          countryName: event.countryName));
    } catch (e) {
      emit(state.copyWith(cardStatus: CardStatus.error));
    }
  }
}
