part of 'user_bloc.dart';

enum UserStatus { initial, loaded, error }

extension UserStatusX on UserStatus {
  bool get isLoaded => [UserStatus.loaded].contains(this);
}

class UserState extends Equatable {
  const UserState({required this.userEnity, required this.userStatus, required this.message});
  final UserEnity userEnity;
  final UserStatus userStatus;
  final String message;
  @override
  List<Object> get props => [userEnity, userStatus, message];

  UserState copyWith({
    UserEnity? userEnity,
    UserStatus? userStatus,
    String? message,
  }) {
    return UserState(
      userEnity: userEnity ?? this.userEnity,
      userStatus: userStatus ?? this.userStatus,
      message: message ?? this.message,
    );
  }
}
