part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class ProcessContactEvent extends ContactEvent {
  const ProcessContactEvent({
    required this.name,
    required this.phoneNumber,
    required this.email,

    this.countryName,
  });
  final String name;
  final String phoneNumber;
  final String email;
  final String? countryName;


  @override
  List<Object> get props => [name, phoneNumber, email];
}

class CallContactEvent extends ContactEvent {}


class UpdateContactEvent extends ContactEvent{
   const UpdateContactEvent({
    required this.name,
    required this.phoneNumber,
    required this.email,

  });
  final String name;
  final String phoneNumber;
  final String email;


  @override
  List<Object> get props => [name, phoneNumber, email];
}