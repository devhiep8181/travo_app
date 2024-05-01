
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/app_export.dart';

part 'choose_card_event.dart';
part 'choose_card_state.dart';

class ChooseCardBloc extends Bloc<ChooseCardEvent, ChooseCardState> {
  ChooseCardBloc()
      : super(ChooseCardState(
          imagePath: '',
          titlePayment: '',
          chooseCardStatus: ChooseCardStatus.initial,
          chooseCard: {TextConstant.miniMarketText: false},
        )) {
    on<ImportCardEvent>(_onImportCardEvent);
  }

  void _onImportCardEvent(
      ImportCardEvent event, Emitter<ChooseCardState> emit) {
    emit(state.copyWith(chooseCardStatus: ChooseCardStatus.loading));
    //print('${event.titlePayment}: true}');
    emit(state.copyWith(
        imagePath: event.imagePath,
        titlePayment: event.titlePayment,
        chooseCard: {event.titlePayment: true},
        chooseCardStatus: ChooseCardStatus.loaded));
  }
}
