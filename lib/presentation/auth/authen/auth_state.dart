part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, guest}

// class AuthState extends Equatable {
//   const AuthState.authenticated()
//       : this._(authStatus: AuthStatus.authenticated, isFirstEntry: true);

//   const AuthState.isFistEntry() : this._(authStatus: AuthStatus.unknown, isFirstEntry: true);

//   const AuthState.unknown() : this._();
//   const AuthState.guest()
//       : this._(authStatus: AuthStatus.guest, isFirstEntry: false);
//   const AuthState.error()
//       : this._(authStatus: AuthStatus.unknown, isFirstEntry: false);
//   const AuthState._(
//       {this.authStatus = AuthStatus.unknown, this.isFirstEntry = false});

//   final AuthStatus authStatus;
//   final bool isFirstEntry;

//   @override
//   List<Object> get props => [authStatus, isFirstEntry];
// }


class AuthState extends Equatable{
  @override
  List<Object?> get props => [];
}

class InitalAppState extends AuthState{}

class FirstAppState extends AuthState{}

class GuestAppState extends AuthState{}

class AuthenAppSate extends AuthState{}

class ErrorAppState extends AuthState{
}