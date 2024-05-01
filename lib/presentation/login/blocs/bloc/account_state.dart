part of 'account_bloc.dart';

class AccountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RememberAccount extends AccountState {}

class DonotRememberAccount extends AccountState {}

class InitAccountState extends AccountState {
  InitAccountState({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  
  @override
  List<Object?> get props => [email, password];
}
