import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/repositories/rating_repository/react_repository.dart';
import '../../datasources/rating/react_remote_datasoure.dart';

class ReactRepositoryImpl implements ReactRepository {
  ReactRepositoryImpl({
    required this.networkInfo,
    required this.reactRemoteDatasource,
  });
  final NetworkInfo networkInfo;
  final ReactRemoteDatasource reactRemoteDatasource;

  @override
  Future<Either<Failure, void>> updateReact(
      {required String uid,
      required int like,
      required int dislike,
    }) async {
    if (await networkInfo.isConnected) {
      try {
        await reactRemoteDatasource.updateReactReviewHotel(
            uid: uid,
            like: like,
            dislike: dislike,
           );
        return const Right(null);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
