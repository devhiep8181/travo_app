import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/text_constant.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/get_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.getUserUseCase})
      : super(const UserState(
            message: '',
            userEnity: UserEnity(email: ''),
            userStatus: UserStatus.initial)) {
    on<GetUserFireBase>(_onGetUserFireBase);
  }
  final GetUserUseCase getUserUseCase;

  FutureOr<void> _onGetUserFireBase(
      GetUserFireBase event, Emitter<UserState> emit) async {
    try {
      final result = await getUserUseCase(event.email);
      
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)), (success) {
      

        emit(state.copyWith(userEnity: success, userStatus: UserStatus.loaded));
      });
    } catch (e) {
      emit(state.copyWith(userStatus: UserStatus.error));
    }
  }
}
