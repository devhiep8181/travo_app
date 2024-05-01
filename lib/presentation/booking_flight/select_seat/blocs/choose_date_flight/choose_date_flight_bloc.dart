
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/utils/date_time_format.dart';
import '../../../../booking/book_and_review/blocs/choose_date/choose_date_data.dart';

part 'choose_date_flight_event.dart';
part 'choose_date_flight_state.dart';

class ChooseDateFlightBloc
    extends Bloc<ChooseDateFlightEvent, ChooseDateFlightState> {
  ChooseDateFlightBloc()
      : super(const ChooseDateFlightState(
            depatureDate: {},
            returnDate: '',
            message: '',
            chooseDateFlightStatus: ChooseDateFlightStatus.initial)) {
    on<ChooseDepartureDateEvent>(_onChooseDepartureDateEvent);
    on<ChooseReturnDateEvent>(_onChooseReturnDateEvent);
  }

  void _onChooseDepartureDateEvent(
      ChooseDepartureDateEvent event, Emitter<ChooseDateFlightState> emit) {
    try {
      final date = event.departureDate;

      final depatureDateItem =
          '${date.day}, ${monthData[date.month.toString().padLeft(2, '0')]} ${date.year}';
      final mapDepatureDate = Map<String, String>.from(state.depatureDate);
      if (event.twoWay) {
        mapDepatureDate[TextConstant.keyDepatureFlight2] = depatureDateItem;
      } else {
        mapDepatureDate[TextConstant.keyDepatureFlight1] = depatureDateItem;
      }
      emit(state.copyWith(
          depatureDate: mapDepatureDate,
          chooseDateFlightStatus: ChooseDateFlightStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          chooseDateFlightStatus: ChooseDateFlightStatus.error,
          message: e.toString()));
    }
  }

  void _onChooseReturnDateEvent(
      ChooseReturnDateEvent event, Emitter<ChooseDateFlightState> emit) {
    try {
      final dateDeparture =
          DateTimeFormat.dateTimeFormatFlight(event.departureDate);
      final dateReturn = DateTimeFormat.dateTimeFormatFlight(event.returnDate);
      final mapDepatureDate = Map<String, String>.from(state.depatureDate);
      mapDepatureDate[TextConstant.keyDepatureFlight1] = dateDeparture;

      emit(state.copyWith(
          chooseDateFlightStatus: ChooseDateFlightStatus.loaded,
          depatureDate: mapDepatureDate,
          returnDate: dateReturn));
    } catch (e) {
      emit(state.copyWith(
          chooseDateFlightStatus: ChooseDateFlightStatus.error,
          message: e.toString()));
    }
  }
}
