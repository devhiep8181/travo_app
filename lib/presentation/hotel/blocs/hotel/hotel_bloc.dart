import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/app_export.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/hotel_entity.dart';
import '../../../../domain/usecases/hotel/get_hotel_usecase.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc({required this.getHotelUsecase}) : super(HotelInitial()) {
    on<GetHotelEvent>(_onGetHotelEvent);
    on<SearchHotelEvent>(_onSearchHotelEvent);
    on<FilterHotelWithPrice>(_onFilterHotelWithPrice);
  }
  final GetHotelUsecase getHotelUsecase;

  FutureOr<void> _onGetHotelEvent(
      HotelEvent event, Emitter<HotelState> emit) async {
    try {
      emit(HotelLoading());
      final result = await getHotelUsecase(NoParams());
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(HotelError(message: TextConstant.noConnection))
              : emit(HotelError(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)),
          (success) => emit(HotelLoaded(listHotel: success)));
    } catch (e) {
      emit(HotelError(message: e.toString()));
    }
  }

  FutureOr<void> _onSearchHotelEvent(
      SearchHotelEvent event, Emitter<HotelState> emit) async {
    emit(HotelLoading());
    final result = await getHotelUsecase(NoParams());
    result.fold(
        (failure) => failure is OfflineFailure
            ? emit(HotelError(message: TextConstant.noConnection))
            : emit(HotelError(
                message: (failure as ServerFailure).message ??
                    TextConstant.defaultErrorMessage)), (success) {
      if (event.textSearchHotel.isEmpty) {
        return emit(HotelLoaded(listHotel: success));
      } else if (event.textSearchHotel.length == 1) {
        final result = success
            .where((element) => element.name
                .toLowerCase()
                .startsWith(event.textSearchHotel.toLowerCase()))
            .toList();
        if (result.isEmpty) {
          return emit(NotFoundHotel());
        }
        return emit(HotelLoaded(listHotel: result));
      } else {
        final result = success
            .where((element) => element.name
                .toLowerCase()
                .contains(event.textSearchHotel.toLowerCase()))
            .toList();
        if (result.isEmpty) {
          return emit(NotFoundHotel());
        }
        return emit(HotelLoaded(listHotel: result));
      }
    });
  }

  FutureOr<void> _onFilterHotelWithPrice(
      FilterHotelWithPrice event, Emitter<HotelState> emit) async {
    emit(HotelLoading());
    final result = await getHotelUsecase(NoParams());
    result.fold(
        (failure) => failure is OfflineFailure
            ? emit(HotelError(message: TextConstant.noConnection))
            : emit(HotelError(
                message: (failure as ServerFailure).message ??
                    TextConstant.defaultErrorMessage)), (success) {
      switch (event.typeFilter) {
        case TypeFilter.choosePrice:
          final result = success
              .where((element) =>
                  element.price! >= event.priceStart! &&
                  element.price! <= event.priceEnd!)
              .toList();
          if (result.isEmpty) {
            return emit(NotFoundHotel());
          }
          return emit(HotelLoaded(listHotel: result));

        case TypeFilter.sortPriceHighToLow:
          success.sort((a, b) => b.price!.compareTo(a.price!));
          return emit(HotelLoaded(listHotel: success));

        case TypeFilter.sortPriceLowToHigh:
          success.sort((a, b) => a.price!.compareTo(b.price!));
          return emit(HotelLoaded(listHotel: success));
      }
    });
  }
}
