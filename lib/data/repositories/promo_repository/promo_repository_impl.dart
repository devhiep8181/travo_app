import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/entities/promo_entity.dart';
import '../../../domain/repositories/promo_repository/promo_repository.dart';
import '../../datasources/promo/promo_remote_datasource.dart';

class PromoRepositoryImpl implements PromoRepository {
  PromoRepositoryImpl({
    required this.networkInfo,
    required this.promoRemoteDatasoure,
  });
  final NetworkInfo networkInfo;
  final PromoRemoteDatasoure promoRemoteDatasoure;
  @override
  Future<Either<Failure, List<PromoEntity>>> getListPromo() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await promoRemoteDatasoure.getPromo();
        return Right(result);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
