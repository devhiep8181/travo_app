part of 'add_passenger_bloc.dart';

abstract class AddPassengerEvent extends Equatable {
  const AddPassengerEvent();

  @override
  List<Object> get props => [];
}

class ProcessAddPassengerEvent extends AddPassengerEvent {
  const ProcessAddPassengerEvent({
    required this.keyMapIndentity,
    required this.indentity,
    required this.namePassenger,
    required this.countPassengers,
    required this.email,
  });
  final int keyMapIndentity;
  final String indentity;
  final String namePassenger;
  final int countPassengers;
  final String email;

  @override
  List<Object> get props =>
      [keyMapIndentity, indentity, namePassenger, countPassengers, email];
}

class UpdateNamePassengerEvent extends AddPassengerEvent {
  const UpdateNamePassengerEvent({
    required this.name,
    required this.keyName,
  });
  final String name;
  final String keyName;
  
  @override
  List<Object> get props => [name, keyName];
}

class UpdateIndentityPassengerEvent extends AddPassengerEvent {
  const UpdateIndentityPassengerEvent({
   required this.indentityUpdate,
   required this.keyIndentity,
  });
  final String indentityUpdate;
  final int keyIndentity;
  
  @override
  List<Object> get props => [indentityUpdate, keyIndentity];
}



class UpdateEmailPassengerEvent extends AddPassengerEvent {
  const UpdateEmailPassengerEvent({
   required this.emailUpdate,
   required this.keyEmail,
  });
  final String emailUpdate;
  final String keyEmail;
  
  @override
  List<Object> get props => [emailUpdate, keyEmail];
}

