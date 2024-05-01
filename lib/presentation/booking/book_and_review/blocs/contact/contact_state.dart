part of 'contact_bloc.dart';

enum ContactStatus { initial, loading, loaded, success, errror }

extension ContactStatusX on ContactStatus {
  bool get isLoaded => [ContactStatus.loaded].contains(this);
  bool get isSuccess => [ContactStatus.success].contains(this);
}

class ContactState extends Equatable {
  const ContactState({required this.contactStatus, required this.userEnity});
  final UserEnity userEnity;
  final ContactStatus contactStatus;

  @override
  List<Object> get props => [userEnity, contactStatus];

  ContactState copyWith({
    UserEnity? userEnity,
    ContactStatus? contactStatus,
  }) {
    return ContactState(
      userEnity: userEnity ?? this.userEnity,
      contactStatus: contactStatus ?? this.contactStatus,
    );
  }
}
