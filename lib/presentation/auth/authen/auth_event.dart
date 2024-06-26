part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent{}

class LoginRequested extends AuthEvent {
  const LoginRequested({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
  @override
  List<Object> get props => [email, password];
}

class LogoutRequested extends AuthEvent{}
