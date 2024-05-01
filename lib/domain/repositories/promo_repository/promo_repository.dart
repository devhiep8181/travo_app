
import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/promo_entity.dart';

abstract class PromoRepository{
  Future<Either<Failure, List<PromoEntity>>> getListPromo();
}