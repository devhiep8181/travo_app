// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

// Project imports:
import '../../../../configs/cache/app_cache.dart';
import '../../../../domain/entities/user_entity.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(RememberAccount()) {
    on<ToggleCheckboxEvent>(_onToggleCheckboxEvent);
    on<InitAccountEvent>(_onInitAccountEvent);
  }

  FutureOr<void> _onToggleCheckboxEvent(
      ToggleCheckboxEvent event, Emitter<AccountState> emit) async {
    if (event.checkRemember) {
      final accountInfo =
          UserEnity(email: event.email, password: event.password);
      Logger().i('account Info: ${accountInfo.email}');
      await AppCache.setString(KeyAcc.email.path, accountInfo.toJson());
      final userrr = await AppCache.getString(KeyAcc.email.path);
      Logger().i('User: $userrr');
      emit(RememberAccount());
    } else {
      Logger().d('debug');
      await AppCache.remove(KeyAcc.email.path);
      emit(DonotRememberAccount());
    }
  }

  FutureOr<void> _onInitAccountEvent(
      InitAccountEvent event, Emitter<AccountState> emit) async {
    final account = await AppCache.getString(KeyAcc.email.path);
    if (account != null) {
      final accountFormJson = UserEnity.fromJson(account);
      emit(InitAccountState(
          email: accountFormJson.email, password: accountFormJson.password!));
    }
  }
}

enum KeyAcc {
  email('email');

  const KeyAcc(this.path);
  final String path;
}
