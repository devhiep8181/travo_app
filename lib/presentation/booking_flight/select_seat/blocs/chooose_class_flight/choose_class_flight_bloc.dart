
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../widgets/choose_class_flight_widget.dart';

part 'choose_class_flight_event.dart';
part 'choose_class_flight_state.dart';

class ChooseClassFlightBloc
    extends Bloc<ChooseClassFlightEvent, ChooseClassFlightState> {
  ChooseClassFlightBloc()
      : super(const ChooseClassFlightState(
            countBusinessClass: 0,
            countEconomyClass: 0,
            chooseClassFlightStatus: ChooseClassFlightStatus.initial,
            valueClassFlight: {})) {
    on<ProcessClassFlightEvent>(_onProcessClassFlightEvent);
    //on<RefreshClasFlightEvent>(_onRefreshClasFlightEvent);
  }

  //TODO: XỬ LÝ PHẦN CHỌN CLASS SEATS -> chưa hợp lý
  void _onProcessClassFlightEvent(
      ProcessClassFlightEvent event, Emitter<ChooseClassFlightState> emit) {
    try {
      var countBussinessClass = state.countBusinessClass;
      var countEconomyClass = state.countEconomyClass;
      final mapClassFlight = Map<int, String>.from(state.valueClassFlight);
      mapClassFlight[event.indexClassFlight] = event.valueClassFlight;
      print('before:');
      print('economy: $countEconomyClass');
      print('business: $countBussinessClass');
      if (event.valueClassFlight == classFlight[0]) {
        countEconomyClass++;
      } else {
        countBussinessClass++;
        countEconomyClass--;
      }

      print('affter:');
      print('economy: $countEconomyClass');
      print('business: $countBussinessClass');
      emit(state.copyWith(
          countBusinessClass: countBussinessClass,
          countEconomyClass: countEconomyClass,
          chooseClassFlightStatus: ChooseClassFlightStatus.loaded,
          valueClassFlight: mapClassFlight));
    } catch (e) {
      emit(state.copyWith(
          chooseClassFlightStatus: ChooseClassFlightStatus.error));
    }
  }

  // FutureOr<void> _onRefreshClasFlightEvent(
  //     RefreshClasFlightEvent event, Emitter<ChooseClassFlightState> emit) {
  //   try {
  //     emit(state.copyWith(
  //         countBusinessClass: event.countBussnessClass,
  //         countEconomyClass: event.countEconomyClass,
  //         chooseClassFlightStatus: ChooseClassFlightStatus.loaded));
  //   } catch (e) {
  //     emit(state.copyWith(
  //         chooseClassFlightStatus: ChooseClassFlightStatus.error));
  //   }
  // }
}
