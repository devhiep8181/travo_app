part of 'create_user_bloc.dart';

abstract class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object> get props => [];
}

class ProcessCreateUserEvent extends CreateUserEvent {
  const ProcessCreateUserEvent({
    required this.email,
    required this.password,
    required this.country,
    required this.phoneNumber,
    required this.name,
    required this.image,
  });
  final String email;
  final String password;
  final String country;
  final String phoneNumber;
  final String name;
  final String image;
  @override
  List<Object> get props => [email, password, country, phoneNumber, name, image];
}
