part of 'contact_details_bloc.dart';

abstract class ContactDetailsEvent extends Equatable {
  const ContactDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetContactDetailsEvent extends ContactDetailsEvent {
  const GetContactDetailsEvent({
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
