import '../../../core/app_export.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/promo_model.dart';
import 'promo_remote_datasource.dart';

class PromoRemoteDatasourceImpl implements PromoRemoteDatasoure {
  PromoRemoteDatasourceImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<List<PromoModel>> getPromo() async {
    final listPromo = await baseRemoteDatasource.getData(
        collectionName: TextConstant.promoCollection,
        fromFirestore: PromoModel.fromFireStore);
    return listPromo;
  }
}
