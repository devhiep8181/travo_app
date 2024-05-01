import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import '../../../../configs/cache/app_cache.dart';
import '../../../../core/app_export.dart';
import '../../../../core/data/base_remote_datasource_impl.dart';
import '../../../../core/errors/failures.dart';
import '../../../../domain/entities/booking_entity.dart';
import '../../../../domain/usecases/booking_room/delete_booking_room_usecase.dart';
import '../../../../domain/usecases/booking_room/get_booking_room_usecase.dart';
import '../../../../domain/usecases/booking_room/update_booking_room_usecase.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc({
    required this.getBookingRoomUsecase,
    required this.updateBookingRoomUseCase,
    required this.deleteBookingRoomUseCase,
  }) : super(const BookingState(
            message: '',
            bookinglist: [],
            bookingStatus: BookingStatus.initial)) {
    on<ProcessBookingEvent>(_onProcessBookingEvent);
    on<GetBookingEvent>(_onGetBookingEvent);
    on<EditBookingRoomEvent>(_onEditBookingRoomEvent);
    on<DeleteBookingRoomEvent>(_onDeleteBookingRoomEvent);
  }
  final GetBookingRoomUsecase getBookingRoomUsecase;
  final UpdateBookingRoomUseCase updateBookingRoomUseCase;
  final DeleteBookingRoomUseCase deleteBookingRoomUseCase;

  FutureOr<void> _onProcessBookingEvent(
      ProcessBookingEvent event, Emitter<BookingState> emit) async {
    try {
      emit(state.copyWith(bookingStatus: BookingStatus.loading));
      final uid = const Uuid().v4();
      final booking = BookingEntity(
        creatAt: event.creatAt,
        checkIn: event.checkIn,
        checkOut: event.checkOut,
        emailUser: event.emailUser,
        emailGuest: event.emailGuest,
        nameGuest: event.nameGuest,
        phoneGuest: event.phoneGuest,
        idHotel: event.idHotel,
        nameRoom: event.nameRoom,
        numberCard: event.numberCard,
        expDate: event.expDate,
        cvv: event.cvv,
        country: event.country,
        imageRoom: event.imageRoom,
        typePayment: event.typePayment,
        uidRoomBooking: uid,
      );

      final listBooking = List<BookingEntity>.from(state.bookinglist)
        ..add(booking);

      final listBookingJson =
          jsonEncode(listBooking.map((e) => e.toJson()).toList());
      final userUid = await AppCache.getString(TextConstant.keyUid);
      await AppCache.setString(
          '$userUid${TextConstant.keyBooking}', listBookingJson);

      await BaseRemoteDatasourceImpl().addBooking(
        creatAt: event.creatAt ?? '',
        checkIn: event.checkIn ?? '',
        checkOut: event.checkOut ?? '',
        emailUser: event.emailUser ?? '',
        emailGuest: event.emailGuest ?? '',
        nameGuest: event.nameGuest ?? '',
        phoneGuest: event.phoneGuest ?? '',
        idHotel: event.idHotel ?? '',
        nameRoom: event.nameRoom ?? '',
        numberCard: event.numberCard ?? '',
        expDate: event.expDate ?? '',
        cvv: event.cvv ?? '',
        country: event.country ?? '',
        imagePath: event.imageRoom ?? '',
        typePayment: event.typePayment ?? '',
        uid: uid,
      );
      emit(state.copyWith(
          bookinglist: listBooking, bookingStatus: BookingStatus.loaded));
    } catch (e) {
      emit(state.copyWith(bookingStatus: BookingStatus.error));
    }
  }

  FutureOr<void> _onGetBookingEvent(
      GetBookingEvent event, Emitter<BookingState> emit) async {
    emit(state.copyWith(bookingStatus: BookingStatus.loading));
    try {
      final result = await getBookingRoomUsecase(event.email);
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)), (success) {
        if (success.isEmpty) {
          emit(state.copyWith(bookingStatus: BookingStatus.error));
        } else {
          emit(state.copyWith(
              bookinglist: success, bookingStatus: BookingStatus.loaded));
        }
      });
    } catch (e) {
      Logger().e('error: $e');
      emit(state.copyWith(bookingStatus: BookingStatus.error));
    }
  }

  FutureOr<void> _onEditBookingRoomEvent(
      EditBookingRoomEvent event, Emitter<BookingState> emit) async {
    try {
      final listBooking = List<BookingEntity>.from(state.bookinglist);
      final booking = listBooking
          .where((element) => event.uid == element.uidRoomBooking)
          .single;
      if (listBooking.contains(booking)) {
        final updateBooking = BookingEntity(
          creatAt: DateTime.now().toIso8601String(),
          checkIn: event.checkIn,
          checkOut: event.checkOut,
          emailUser: booking.emailUser,
          emailGuest: event.emailGuest,
          nameGuest: event.nameGuest,
          phoneGuest: event.phoneGuest,
          idHotel: event.idHotel,
          nameRoom: event.nameRoom,
          numberCard: booking.numberCard,
          expDate: booking.expDate,
          cvv: booking.cvv,
          country: booking.country,
          imageRoom: event.imageRoom,
          typePayment: booking.typePayment,
          uidRoomBooking: event.uid ?? '',
        );
        listBooking
          ..remove(booking)
          ..add(updateBooking);

        await updateBookingRoomUseCase(UpdateBookingParams(
            creatAt: DateTime.now().toIso8601String(),
            checkIn: event.checkIn,
            checkOut: event.checkOut,
            emailGuest: event.emailGuest,
            nameGuest: event.nameGuest,
            idHotel: event.idHotel,
            phoneGuest: event.phoneGuest,
            nameRoom: event.nameRoom,
            imageRoom: event.imageRoom,
            uid: event.uid));

        emit(state.copyWith(
            bookinglist: listBooking, bookingStatus: BookingStatus.success));
      } else {
        emit(state.copyWith(bookingStatus: BookingStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(bookingStatus: BookingStatus.error));
    }
  }

  FutureOr<void> _onDeleteBookingRoomEvent(
      DeleteBookingRoomEvent event, Emitter<BookingState> emit) async {
    try {
      final listBookingRoom = List<BookingEntity>.from(state.bookinglist);
      final bookingRoom = listBookingRoom
          .where((element) => event.uid == element.uidRoomBooking)
          .single;
      if (listBookingRoom.contains(bookingRoom)) {
        await deleteBookingRoomUseCase(event.uid);
        listBookingRoom.remove(bookingRoom);
        if (listBookingRoom.isEmpty) {
          emit(state.copyWith(bookingStatus: BookingStatus.error));
        } else {
          emit(state.copyWith(
              bookinglist: listBookingRoom,
              bookingStatus: BookingStatus.loaded));
        }
      } else {
        emit(state.copyWith(bookingStatus: BookingStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(bookingStatus: BookingStatus.error));
    }
  }
}
