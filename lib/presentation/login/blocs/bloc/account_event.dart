part of 'account_bloc.dart';


abstract class AccountEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


class ToggleCheckboxEvent extends AccountEvent {
  ToggleCheckboxEvent(
    {
    required this.email,
    required this.password,
    required this.checkRemember,
  });

  final String email;
  final String password;
  final bool checkRemember;

  @override
  List<Object> get props => [email, password];
}

class InitAccountEvent extends AccountEvent{}
