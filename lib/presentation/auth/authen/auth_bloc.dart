// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../configs/cache/auth_cache_manager.dart';
import '../../../domain/usecases/auth/verify_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.verifyUserUseCase,
  }) : super(InitalAppState()) {
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequesst);
  }
  VerifyUserUseCase verifyUserUseCase;

  FutureOr<void> _onAppStarted(
      AppStarted event, Emitter<AuthState> emit) async {
    try {
      if (await AuthCacheManager.isLoggedIn()) {
        await AuthCacheManager.updateFirstEntry();
        emit(AuthenAppSate());
      } else {
        emit(await AuthCacheManager.isFirstEntry()
            ? FirstAppState()
            : GuestAppState());
      }
    } catch (e) {
      emit(ErrorAppState());
    }
  }

  FutureOr<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
   // emit(GuestAppState());
    try {
      final response = await verifyUserUseCase(
          UserParama(email: event.email, password: event.password));
      response.fold((faliure) => emit(ErrorAppState()), (succes) {
        emit(AuthenAppSate());
      });
    } catch (e) {
      emit(ErrorAppState());
    }
  }

  FutureOr<void> _onLogoutRequesst(
      LogoutRequested event, Emitter<AuthState> emit) async {
    await AuthCacheManager.signOut();
    //logout thì về màn login
    emit(GuestAppState());
  }
}
