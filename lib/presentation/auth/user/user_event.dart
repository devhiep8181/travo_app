part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserFireBase extends UserEvent {
  const GetUserFireBase({
    required this.email,
  });
  final String email;

  @override
  List<Object> get props => [email];
}
