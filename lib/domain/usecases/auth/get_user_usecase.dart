import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/user_entity.dart';
import '../../repositories/auth_repository/get_user_repository.dart';

class GetUserUseCase implements UseCase<UserEnity, String> {
  GetUserUseCase({
    required this.getUserRepository,
  });
  final GetUserRepository getUserRepository;

  @override
  Future<Either<Failure, UserEnity>> call(String params) async {
    return getUserRepository.getUser(email: params);
  }
}
