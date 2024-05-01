import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecases/sign_up/creat_user_usecase.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  CreateUserBloc({required this.createUserUsecase})
      : super(const CreateUserState(
            createUserStatus: CreateUserStatus.initial, message: '')) {
    on<ProcessCreateUserEvent>(_onProcessCreateUserEvent);
  }
  final CreateUserUsecase createUserUsecase;

  FutureOr<void> _onProcessCreateUserEvent(
      ProcessCreateUserEvent event, Emitter<CreateUserState> emit) async {
    emit(state.copyWith(createUserStatus: CreateUserStatus.loading));
    try {
      print('name: ${event.name}');
      print('country name bloc: ${event.country}');
      await createUserUsecase(UserEnity(
        email: event.email,
        password: event.password,
        phoneNumber: event.phoneNumber,
        displayName: event.name,
        countryName: event.country,
        image: event.image,
      ));

      emit(state.copyWith(createUserStatus: CreateUserStatus.success));
    } catch (e) {
      emit(state.copyWith(createUserStatus: CreateUserStatus.error));
    }
  }
}
