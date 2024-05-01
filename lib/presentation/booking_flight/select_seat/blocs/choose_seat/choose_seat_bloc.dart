import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../widgets/choose_class_flight_widget.dart';

part 'choose_seat_event.dart';
part 'choose_seat_state.dart';

class ChooseSeatBloc extends Bloc<ChooseSeatEvent, ChooseSeatState> {
  ChooseSeatBloc()
      : super(const ChooseSeatState(
          countSeatsBussineesChoose: 0,
          countSeatsEnconomyChoose: 0,
          seats: {},
          chooseSeat: {},
          chooseSeatStatus: ChooseSeatStatus.initial,
          classSeat: {},
        )) {
    on<GetSeatEvent>(_onGetSeatEvent);
  }

  void _onGetSeatEvent(GetSeatEvent event, Emitter<ChooseSeatState> emit) {
    try {
      //emit(state.copyWith(chooseSeatStatus: ChooseSeatStatus.loading));

      // Khởi tạo map lưu trữ chỗ ngồi đã chọn
      final selectedSeatMap = Map<String, Map<String, bool>>.from(state.seats);
      final chooseSeat = Map<String, String>.from(state.chooseSeat);
      final chooseClass = Map<String, String>.from(state.classSeat);
      var countBusiness = state.countSeatsBussineesChoose;
      var countEconomy = state.countSeatsEnconomyChoose;
//Trong trường hợp số lượng ghế đạt tối đa, nhưng muốn chuyển sang ghế khác cùng hạng
//Chưa nghĩ ra 
      // if(countBusiness == event.coutBussinessClass){

      // }
// Xử lý chọn/bỏ chọn
      if (event.seatCheck == false &&
          selectedSeatMap.containsKey(event.seatClass) &&
          selectedSeatMap[event.seatClass]?[event.seatLocation] == true) {
        selectedSeatMap[event.seatClass]?[event.seatLocation] = false;
        if (event.keySeatEvent.contains(classFlight[0])) {
          countEconomy--;
        } else {
          countBusiness--;
        }
        chooseSeat.remove(event.keySeatEvent);
        chooseClass.remove(event.keySeatEvent);
      } else {
        selectedSeatMap.putIfAbsent(
            event.seatClass, () => {})[event.seatLocation] = true;
        if (event.keySeatEvent.contains(classFlight[0])) {
          countEconomy++;
        } else {
          countBusiness++;
        }
        chooseClass[event.keySeatEvent] = event.seatClass;
        chooseSeat[event.keySeatEvent] = event.seatLocation;
      }
      print('countBusiness: $countBusiness');
      print('count enconomy: $countEconomy');
      if (chooseSeat.isEmpty) {
        emit(state.copyWith(
            countSeatsBussineesChoose: countBusiness,
            countSeatsEnconomyChoose: countEconomy,
            seats: selectedSeatMap,
            chooseSeat: chooseSeat,
            classSeat: chooseClass,
            chooseSeatStatus: ChooseSeatStatus.initial));
      } else {
        emit(state.copyWith(
            countSeatsBussineesChoose: countBusiness,
            countSeatsEnconomyChoose: countEconomy,
            seats: selectedSeatMap,
            chooseSeat: chooseSeat,
            classSeat: chooseClass,
            chooseSeatStatus: ChooseSeatStatus.loaded));
      }
    } catch (e) {
      emit(state.copyWith(chooseSeatStatus: ChooseSeatStatus.error));
    }
  }
}
