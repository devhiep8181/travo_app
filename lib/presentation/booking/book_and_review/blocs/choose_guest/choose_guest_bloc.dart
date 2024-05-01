
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'choose_guest_event.dart';
part 'choose_guest_state.dart';

class ChooseGuestBloc extends Bloc<ChooseGuestEvent, ChooseGuestState> {
  ChooseGuestBloc()
      : super(const ChooseGuestState(
            chooseGuestStatus: ChooseGuestStatus.initial, valueGuest: '1')) {
    on<IncreaseGuestEvent>(_onIncreaseGuestEvent);
    on<ReduceGuestEvent>(_onReduceGuestEvent);
    on<ImportGuestEvent>(_onImportGuestEvent);
  }

  void _onIncreaseGuestEvent(
      IncreaseGuestEvent event, Emitter<ChooseGuestState> emit) {
    var valueGuest = int.parse(event.valueGuest);
    valueGuest++;
    emit(state.copyWith(
        valueGuest: valueGuest.toString(),
        chooseGuestStatus: ChooseGuestStatus.loaded));
  }

  void _onReduceGuestEvent(
      ReduceGuestEvent event, Emitter<ChooseGuestState> emit) {
    var valueGuest = int.parse(event.valueGuest);

    if (valueGuest > 1) {
      valueGuest--;
    }
    //TODO: CẢNH BÁO KHI VỀ 1
    emit(state.copyWith(
        valueGuest: valueGuest.toString(),
        chooseGuestStatus: ChooseGuestStatus.loaded));
  }

  void _onImportGuestEvent(
      ImportGuestEvent event, Emitter<ChooseGuestState> emit) {
    emit(state.copyWith(
        valueGuest: event.valueGuest,
        chooseGuestStatus: ChooseGuestStatus.loaded));
  }
}
