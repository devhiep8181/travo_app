import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/user_entity.dart';
import '../../repositories/sign_up_repository/create_user_repository.dart';

class CreateUserUsecase implements UseCase<void, UserEnity> {
  CreateUserUsecase({
    required this.createUserRepository,
  });
  CreateUserRepository createUserRepository;

  @override
  Future<Either<Failure, void>> call(UserEnity params) async {
    return createUserRepository.creatUser(UserEnity(
        email: params.email,
        phoneNumber: params.phoneNumber,
        displayName: params.displayName,
        password: params.password,
        countryName: params.countryName,
        image: params.image,
        ));
  }
}
