import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/text_constant.dart';
import '../../../../domain/entities/booking_flight_entity.dart';
import '../../../../domain/usecases/booking_flight/get_booking_flight_usecase.dart';
import '../../../../domain/usecases/flight/booking_flight_usecase.dart';
import '../../../../domain/usecases/flight/delete_booking_flight_usecase.dart';
import '../../../../domain/usecases/flight/update_booking_flight_usecase.dart';

part 'confirm_flight_event.dart';
part 'confirm_flight_state.dart';

class ConfirmFlightBloc extends Bloc<ConfirmFlightEvent, ConfirmFlightState> {
  ConfirmFlightBloc({
    required this.bookingFlightUseCase,
    required this.getBookingFlightUseCase,
    required this.updateBookingFlightUseCase,
    required this.deleteBookingFlightUseCase,
  }) : super(const ConfirmFlightState(
            message: '',
            bookingFlightEntity: [],
            confirmFlightStatus: ConfirmFlightStatus.initial)) {
    on<ProcessConfirmFlightEvent>(_onProcessConfirmFlightEvent);
    on<GetBookingFlightEvent>(_onGetBookingFlightEvent);
    on<UpdateBookingFlightEvent>(_onUpdateBookingFlightEvent);
    on<DeleteBookingFlightEvent>(_onDeleteBookingFlightEvent);
  }

  final GetBookingFlightUseCase getBookingFlightUseCase;

  final BookingFlightUseCase bookingFlightUseCase;

  final UpdateBookingFlightUseCase updateBookingFlightUseCase;

  final DeleteBookingFlightUseCase deleteBookingFlightUseCase;

  FutureOr<void> _onProcessConfirmFlightEvent(
      ProcessConfirmFlightEvent event, Emitter<ConfirmFlightState> emit) async {
    try {
      final listnameGuest = <String>[];
      final listSeat = <String>[];
      final listClassSeat = <String>[];
      final listBookignFLight =
          List<BookingFlightEntity>.from(state.bookingFlightEntity);
      for (var i = 1; i < event.passengers + 1; i++) {
        listnameGuest.add(
            event.mapValueNameGuest[event.mapValueIndentity[i]].toString());
      }
      for (final seatEntiy in event.seats.entries) {
        listSeat.add(seatEntiy.value);
      }
      for (final classSeatEnity in event.classSeats.entries) {
        listClassSeat.add(classSeatEnity.value);
      }

      final uid = const Uuid().v4();
      final bookingFlight = BookingFlightEntity(
        creatAt: event.creatAt,
        emailUser: event.emailUser,
        passengers: event.passengers,
        totalPrice: event.totalPrice,
        promoCode: event.promoCode,
        nameGuest: listnameGuest,
        nameAirline: event.nameAirline,
        seats: listSeat,
        classSeats: listClassSeat,
        date: event.date,
        typePayment: event.typePayment,
        numberCard: event.numberCard,
        expDate: event.expDate,
        cvv: event.cvv,
        country: event.country,
        uidBookingFlight: uid,
      );

      listBookignFLight.add(bookingFlight);

      await bookingFlightUseCase.call(bookingFlight);

      emit(state.copyWith(
          bookingFlightEntity: listBookignFLight,
          confirmFlightStatus: ConfirmFlightStatus.success));
    } catch (e) {
      emit(state.copyWith(confirmFlightStatus: ConfirmFlightStatus.error));
    }
  }

  FutureOr<void> _onGetBookingFlightEvent(
      GetBookingFlightEvent event, Emitter<ConfirmFlightState> emit) async {
    try {
      final result = await getBookingFlightUseCase(event.email);
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)), (success) {
        if (success.isEmpty) {
          emit(state.copyWith(confirmFlightStatus: ConfirmFlightStatus.error));
        } else {
          emit(state.copyWith(
              bookingFlightEntity: success,
              confirmFlightStatus: ConfirmFlightStatus.success));
        }
      });
    } catch (e) {
      emit(state.copyWith(confirmFlightStatus: ConfirmFlightStatus.error));
    }
  }

  FutureOr<void> _onUpdateBookingFlightEvent(
      UpdateBookingFlightEvent event, Emitter<ConfirmFlightState> emit) async {
    try {
      final listBookingFlight =
          List<BookingFlightEntity>.from(state.bookingFlightEntity);
      final bookingFlightCheck = listBookingFlight
          .where((element) => event.uid == element.uidBookingFlight)
          .single;
      if (listBookingFlight.contains(bookingFlightCheck)) {
        final listnameGuest = <String>[];
        final listSeat = <String>[];
        final listClassSeat = <String>[];

        for (var i = 1; i < event.passengers + 1; i++) {
          listnameGuest.add(
              event.mapValueNameGuest[event.mapValueIndentity[i]].toString());
        }
        for (final seatEntiy in event.seats.entries) {
          listSeat.add(seatEntiy.value);
        }
        for (final classSeatEnity in event.classSeats.entries) {
          listClassSeat.add(classSeatEnity.value);
        }

        final updateBookingFlight = BookingFlightEntity(
          creatAt: event.creatAt,
          emailUser: event.emailUser,
          passengers: event.passengers,
          totalPrice: event.totalPrice,
          promoCode: event.promoCode,
          nameGuest: listnameGuest,
          nameAirline: event.nameAirline,
          seats: listSeat,
          classSeats: listClassSeat,
          date: event.date,
          typePayment: bookingFlightCheck.typePayment,
          numberCard: bookingFlightCheck.numberCard,
          expDate: bookingFlightCheck.expDate,
          cvv: bookingFlightCheck.cvv,
          country: bookingFlightCheck.country,
        );

        listBookingFlight
          ..remove(bookingFlightCheck)
          ..add(updateBookingFlight);

        await updateBookingFlightUseCase(UpdateBookingFlightParams(
            creatAt: event.creatAt,
            emailUser: event.emailUser,
            passengers: event.passengers,
            totalPrice: event.totalPrice,
            promoCode: event.promoCode,
            nameGuest: listnameGuest,
            nameAirline: event.nameAirline,
            seats: listSeat,
            classSeats: listClassSeat,
            date: event.date,
            uid: event.uid));

        emit(state.copyWith(
            bookingFlightEntity: listBookingFlight,
            confirmFlightStatus: ConfirmFlightStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(confirmFlightStatus: ConfirmFlightStatus.error));
    }
  }

  FutureOr<void> _onDeleteBookingFlightEvent(
      DeleteBookingFlightEvent event, Emitter<ConfirmFlightState> emit) async {
    try {
      final listBookingFlight =
          List<BookingFlightEntity>.from(state.bookingFlightEntity);
      final bookingFlight = listBookingFlight
          .where((element) => element.uidBookingFlight == event.uid)
          .single;
      if (listBookingFlight.contains(bookingFlight)) {
        await deleteBookingFlightUseCase(event.uid);
        listBookingFlight.remove(bookingFlight);
        if (listBookingFlight.isEmpty) {
          emit(state.copyWith(confirmFlightStatus: ConfirmFlightStatus.error));
        } else {
          emit(state.copyWith(
              bookingFlightEntity: listBookingFlight,
              confirmFlightStatus: ConfirmFlightStatus.success));
        }
      } else {
        emit(state.copyWith(confirmFlightStatus: ConfirmFlightStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(confirmFlightStatus: ConfirmFlightStatus.error));
    }
  }
}
