import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/booking_entity.dart';

part 'modify_or_choose_room_event.dart';
part 'modify_or_choose_room_state.dart';

class ModifyOrChooseRoomBloc
    extends Bloc<ModifyOrChooseRoomEvent, ModifyOrChooseRoomState> {
  ModifyOrChooseRoomBloc()
      : super(const ModifyOrChooseRoomState(
            bookingEntity: BookingEntity(
                creatAt: '',
                checkIn: '',
                checkOut: '',
                emailUser: '',
                emailGuest: '',
                nameGuest: '',
                phoneGuest: '',
                idHotel: '',
                nameRoom: '',
                numberCard: '',
                expDate: '',
                cvv: '',
                country: '',
                imageRoom: '',
                typePayment: '',
                uidRoomBooking: ''),
            modifyBookingRoom: false,
            modifyorChooseRoomStatus: ModifyorChooseRoomStatus.initial)) {
    on<ProcessModifyOrChooseRoomEvent>(_onProcessModifyOrChooseRoomEvent);
    on<GetRoomModifyEvent>(_onGetRoomModifyEvent);
  }

  FutureOr<void> _onProcessModifyOrChooseRoomEvent(
      ProcessModifyOrChooseRoomEvent event,
      Emitter<ModifyOrChooseRoomState> emit) {
    emit(state.copyWith(
        modifyBookingRoom: event.modifyBookingRoom,
        modifyorChooseRoomStatus: ModifyorChooseRoomStatus.loaded));
  }

  FutureOr<void> _onGetRoomModifyEvent(
      GetRoomModifyEvent event, Emitter<ModifyOrChooseRoomState> emit) {
    try {
      emit(state.copyWith(bookingEntity: event.bookingEntity, modifyorChooseRoomStatus: ModifyorChooseRoomStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          modifyorChooseRoomStatus: ModifyorChooseRoomStatus.error));
    }
  }
}
