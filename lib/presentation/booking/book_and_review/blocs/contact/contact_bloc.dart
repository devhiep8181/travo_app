import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../configs/cache/app_cache.dart';
import '../../../../../configs/cache/user_singleton.dart';
import '../../../../../core/app_export.dart';
import '../../../../../domain/entities/user_entity.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc()
      : super(const ContactState(
            contactStatus: ContactStatus.initial,
            userEnity: UserEnity(email: ''))) {
    on<ProcessContactEvent>(_onProcessContactEvent);
    on<CallContactEvent>(_onCallContactEvent);
    on<UpdateContactEvent>(_onUpdateContactEvent);
  }

  FutureOr<void> _onProcessContactEvent(
      ProcessContactEvent event, Emitter<ContactState> emit) async {
    final contactUser = UserEnity(
      email: event.email,
      phoneNumber: event.phoneNumber,
      countryName: event.countryName,
      displayName: event.name,
    );
    await AppCache.setString(event.email, contactUser.toJson());
    emit(state.copyWith(
        userEnity: contactUser, contactStatus: ContactStatus.loaded));
  }

  FutureOr<void> _onCallContactEvent(
      CallContactEvent event, Emitter<ContactState> emit) async {
    final emailUserCache = await AppCache.getString(TextConstant.keyUid);
    final contactJson = await AppCache.getString(emailUserCache ?? '');
    final contactUser = UserEnity.fromJson(contactJson!);
    UserSingleton().login(
      country: contactUser.countryName ?? '',
      email: contactUser.email,
      name: contactUser.displayName ?? '',
      phoneNumber: contactUser.phoneNumber ?? '',
    );
    emit(state.copyWith(
        userEnity: contactUser, contactStatus: ContactStatus.loaded));
  }

  FutureOr<void> _onUpdateContactEvent(
      UpdateContactEvent event, Emitter<ContactState> emit) {
    final contactUser = UserEnity(
      email: event.email,
      phoneNumber: event.phoneNumber,
      displayName: event.name,
    );

    emit(state.copyWith(
        userEnity: contactUser, contactStatus: ContactStatus.success));
  }
}
