part of 'create_user_bloc.dart';

enum CreateUserStatus { initial,loading, success, error }

extension CreateUserStatusX on CreateUserStatus {
  bool get isSucess => [CreateUserStatus.success].contains(this);
  bool get isError => [CreateUserStatus.error].contains(this);
}

class CreateUserState extends Equatable {
  const CreateUserState({
    required this.createUserStatus,
    required this.message,
  });
  final CreateUserStatus createUserStatus;
  final String message;
  @override
  List<Object> get props => [createUserStatus, message];

  CreateUserState copyWith({
    CreateUserStatus? createUserStatus,
    String? message,
  }) {
    return CreateUserState(
      createUserStatus: createUserStatus ?? this.createUserStatus,
      message: message ?? this.message,
    );
  }
}
