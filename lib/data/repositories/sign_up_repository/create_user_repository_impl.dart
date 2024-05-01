import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/sign_up_repository/create_user_repository.dart';
import '../../datasources/sign_up/create_user_remote.dart';
import '../../models/user_model.dart';

class CreateUserRepositoryImpl implements CreateUserRepository {
  CreateUserRepositoryImpl({
    required this.networkInfo,
    required this.createUserRemote,
  });
  final NetworkInfo networkInfo;
  final CreateUserRemote createUserRemote;

  @override
  Future<Either<Failure, void>> creatUser(UserEnity userEnity) async {
    if (await networkInfo.isConnected) {
      try {
        await createUserRemote.createUser(UserModel(
          email: userEnity.email,
          phoneNumber: userEnity.phoneNumber,
          displayName: userEnity.displayName,
          password: userEnity.password,
          countryName: userEnity.countryName,
          image: userEnity.image,
        ));
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
