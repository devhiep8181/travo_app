part of 'contact_details_bloc.dart';

enum ContactDetailsStatus { initial, loaded, error }

extension ContactDetailsStatusX on ContactDetailsStatus {
  bool get isLoaded => [ContactDetailsStatus.loaded].contains(this);
}

class ContactDetailsState extends Equatable {
  const ContactDetailsState(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.contactDetailsStatus});
  final String name;
  final String phoneNumber;
  final String email;
  final ContactDetailsStatus contactDetailsStatus;

  @override
  List<Object> get props => [name, phoneNumber, email];

  ContactDetailsState copyWith({
    String? name,
    String? phoneNumber,
    String? email,
    ContactDetailsStatus? contactDetailsStatus,
  }) {
    return ContactDetailsState(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      contactDetailsStatus: contactDetailsStatus ?? this.contactDetailsStatus,
    );
  }
}

// class ContactDetailsInitial extends ContactDetailsState {}

// class ContactDeatilsLoaded extends ContactDetailsState {
//   const ContactDeatilsLoaded({
//     required this.name,
//     required this.phoneNumber,
//     required this.email,
//   });
//   final String name;
//   final String phoneNumber;
//   final String email;

//   @override
//   List<Object> get props => [name, phoneNumber, email];
// }

// class ContactDetailsError extends ContactDetailsState {
//   const ContactDetailsError({
//     required this.message,
//   });
//   final String message;

//   @override
//   List<Object> get props => [message];
// }
