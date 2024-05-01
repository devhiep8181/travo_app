// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/entities/place_entity.dart';
import '../../../domain/repositories/place_repository/place_repository.dart';
import '../../datasources/place/place_remote_datasource.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  PlaceRepositoryImpl({
    required this.networkInfo,
    required this.placeRemoteDataSource,
  });
  final NetworkInfo networkInfo;
  final PlaceRemoteDataSource placeRemoteDataSource;

  @override
  Future<Either<Failure, List<PlaceEntity>>> getPlace() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await placeRemoteDataSource.getPlace();
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
