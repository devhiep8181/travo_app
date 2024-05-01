// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/repositories/auth_repository/auth_repository.dart';
import '../../datasources/auth/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDatasource,
    required this.networkInfo,
  });
  final AuthRemoteDatasource authRemoteDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, User>> verifyUser(String email, String password) async{
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.getUser(email, password);
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
