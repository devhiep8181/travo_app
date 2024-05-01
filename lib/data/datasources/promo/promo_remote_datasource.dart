import '../../models/promo_model.dart';

abstract class PromoRemoteDatasoure {
  Future<List<PromoModel>> getPromo();
}
