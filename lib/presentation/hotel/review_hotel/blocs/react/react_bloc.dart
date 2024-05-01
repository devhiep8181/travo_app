import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/text_constant.dart';
import '../../../../../domain/usecases/action_react/delete_value_react_usecase.dart';
import '../../../../../domain/usecases/action_react/get_value_react_usecase.dart';
import '../../../../../domain/usecases/action_react/push_value_react_usecase.dart';
import '../../../../../domain/usecases/action_react/update_value_react_usecase.dart';

part 'react_event.dart';
part 'react_state.dart';

class ReactBloc extends Bloc<ReactEvent, ReactState> {
  ReactBloc(
      {required this.deleteValueReactUseCase,
      required this.getValueReactUseCase,
      required this.pushValueReactUseCase,
      required this.updateValueReactUseCase})
      : super(const ReactState(
            listReact: [],
            message: '',
            valueReact: {},
            reactStatus: ReactStatus.initial)) {
    on<PushValueReactEvent>(_onPushValueReactEvent);
    on<DeleteValueReactEvent>(_onDeleteValueReactEvent);
    on<UpdateValueReactEvent>(_onUpdateValueReactEvent);
    on<GetValueReactEvent>(_onGetValueReactEvent);
  }

  final GetValueReactUseCase getValueReactUseCase;
  final PushValueReactUseCase pushValueReactUseCase;
  final DeleteValueReactUseCase deleteValueReactUseCase;
  final UpdateValueReactUseCase updateValueReactUseCase;

  FutureOr<void> _onPushValueReactEvent(
      PushValueReactEvent event, Emitter<ReactState> emit) async {
    try {
      emit(state.copyWith(reactStatus: ReactStatus.loading));
      final result = await pushValueReactUseCase(PushValueReactParams(
          uid: event.uid, email: event.email, valueReact: event.valueReact));
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)),
          (success) => emit(state.copyWith(reactStatus: ReactStatus.loaded)));
    } catch (e) {
      emit(state.copyWith(reactStatus: ReactStatus.error));
    }
  }

  FutureOr<void> _onDeleteValueReactEvent(
      DeleteValueReactEvent event, Emitter<ReactState> emit) async {
    try {
      emit(state.copyWith(reactStatus: ReactStatus.loading));
      final result = await deleteValueReactUseCase(
          ValueReactParamas(uid: event.uid, email: event.email));
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)),
          (success) => emit(state.copyWith(reactStatus: ReactStatus.loaded)));
    } catch (e) {
      emit(state.copyWith(reactStatus: ReactStatus.error));
    }
  }

  FutureOr<void> _onUpdateValueReactEvent(
      UpdateValueReactEvent event, Emitter<ReactState> emit) async {
    try {
      final result = await updateValueReactUseCase(PushValueReactParams(
          uid: event.uid, email: event.email, valueReact: event.valueReact));
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)),
          (success) => emit(state.copyWith(reactStatus: ReactStatus.loaded)));
    } catch (e) {
      emit(state.copyWith(reactStatus: ReactStatus.error));
    }
  }

  FutureOr<void> _onGetValueReactEvent(
      GetValueReactEvent event, Emitter<ReactState> emit) async {
    emit(state.copyWith(reactStatus: ReactStatus.loading));
    try {
      final mapValueReact = Map<String, bool?>.from(state.valueReact);
   
      final result = await getValueReactUseCase(
          ValueReactParamas(uid: event.uid, email: event.email));
      result.fold(
        (failure) => failure is OfflineFailure
            ? emit(state.copyWith(message: TextConstant.noConnection))
            : emit(state.copyWith(
                message: (failure as ServerFailure).message ??
                    TextConstant.defaultErrorMessage)),
        (success) {
          valueStogareReact[event.uid] = success;
          mapValueReact.putIfAbsent(event.uid, () => success);

          emit(state.copyWith(
              valueReact: mapValueReact, reactStatus: ReactStatus.loaded));
        },
      );
    } catch (e) {
      emit(state.copyWith(reactStatus: ReactStatus.error));
    }
  }
}

Map<String, bool?> valueStogareReact = {};
