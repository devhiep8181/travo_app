import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/text_constant.dart';
import '../../../../../domain/entities/promo_entity.dart';
import '../../../../../domain/usecases/promo/get_promo_usecase.dart';

part 'promo_event.dart';
part 'promo_state.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  PromoBloc({required this.getPromoUseCase})
      : super(const PromoState(
            message: '',
            listPromo: [],
            promoStatus: PromoStatus.initial,
            choosePromo:
                PromoEntity(code: '', endow: '', imgae: '', price: 0))) {
    on<GetPromoEvent>(_onGetPromoEvent);
    on<ChoosePromoEvent>(_onChoosePromoEvent);
  }
  final GetPromoUseCase getPromoUseCase;

  FutureOr<void> _onGetPromoEvent(
      GetPromoEvent event, Emitter<PromoState> emit) async {
    try {
      emit(state.copyWith(promoStatus: PromoStatus.loading));
      final result = await getPromoUseCase(NoParams());
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)), (success) {
        emit(state.copyWith(
            listPromo: success, promoStatus: PromoStatus.loaded));
      });
    } catch (e) {
      emit(state.copyWith(message: e.toString()));
    }
  }

  FutureOr<void> _onChoosePromoEvent(
      ChoosePromoEvent event, Emitter<PromoState> emit) {
    try {
      emit(state.copyWith(
          choosePromo: event.choosePromo, promoStatus: PromoStatus.success));
    } catch (e) {
      emit(state.copyWith(promoStatus: PromoStatus.error));
    }
  }
}
