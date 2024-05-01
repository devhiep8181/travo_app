import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/repositories/rating_repository/action_react_repository.dart';
import '../../datasources/rating/action_react_remote_datasource.dart';

class ActionReactRepositoryImpl extends ActionReactRepository {
  ActionReactRepositoryImpl({
    required this.networkInfo,
    required this.actionReactRemoteDataSoure,
  });
  final NetworkInfo networkInfo;
  final ActionReactRemoteDataSoure actionReactRemoteDataSoure;
  @override
  Future<Either<Failure, void>> deleteValueReactWithEmail(
      {required String uid, required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        await actionReactRemoteDataSoure.deleteValueReact(
            uid: uid, email: email);
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, bool?>> getValueReactWithEmail(
      {required String uid, required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await actionReactRemoteDataSoure.getValueReact(
            uid: uid, email: email);
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> pushValueReactWithEmail(
      {required String uid,
      required String email,
      required bool? reactValue}) async {
    if (await networkInfo.isConnected) {
      try {
        await actionReactRemoteDataSoure.pushValueReact(
            uid: uid, email: email, valueReact: reactValue);
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateValueReactWithEmail(
      {required String uid,
      required String email,
      required bool? valueReact}) async {
    if (await networkInfo.isConnected) {
      try {
        await actionReactRemoteDataSoure.updateValueReact(
            uid: uid, email: email, valueReact: valueReact);
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
