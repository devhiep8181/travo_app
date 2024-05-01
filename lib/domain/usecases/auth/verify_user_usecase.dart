// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/auth_repository/auth_repository.dart';

class VerifyUserUseCase implements UseCase<User, UserParama> {
  VerifyUserUseCase({
    required this.authRepository,
  });
  final AuthRepository authRepository;
  @override
  Future<Either<Failure, User>> call(UserParama params) async {
    return authRepository.verifyUser(params.email, params.password);
  }
}

class UserParama extends Equatable{
  const UserParama({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
