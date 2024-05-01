import '../../../configs/cache/app_cache.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/network/network_info.dart';
import '../../../core/utils/text_constant.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/auth_repository/get_user_repository.dart';
import '../../datasources/auth/get_user_remote_datasource.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  GetUserRepositoryImpl({
    required this.networkInfo,
    required this.getUserRemoteDatasource,
  });
  final NetworkInfo networkInfo;
  final GetUserRemoteDatasource getUserRemoteDatasource;

  @override
  Future<Either<Failure, UserEnity>> getUser({required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await getUserRemoteDatasource.getUser(email: email);
        await AppCache.setString(TextConstant.keyUid, result.email);
        final contactUser = UserEnity(
            email: result.email,
            phoneNumber: result.phoneNumber,
            countryName: result.countryName,
            displayName: result.displayName);
        await AppCache.setString(result.email, contactUser.toJson());
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
