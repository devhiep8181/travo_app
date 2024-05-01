import '../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/promo_entity.dart';
import '../../repositories/promo_repository/promo_repository.dart';

class GetPromoUseCase implements UseCase<List<PromoEntity>, NoParams> {
  GetPromoUseCase({
    required this.promoRepository,
  });
  final PromoRepository promoRepository;

  @override
  Future<Either<Failure, List<PromoEntity>>> call(NoParams params) async {
    return promoRepository.getListPromo();
  }
}
