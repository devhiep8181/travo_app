// Project imports:
import '../../../core/app_export.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/place_model.dart';
import 'place_remote_datasource.dart';

class PlaceRemoteDataSourceImpl implements PlaceRemoteDataSource {
  PlaceRemoteDataSourceImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<List<PlaceModel>> getPlace() async {
    final listPlace = await baseRemoteDatasource.getData(
      collectionName: TextConstant.placeCollection,
      fromFirestore: PlaceModel.fromFirestore,
    );
    return listPlace;
  }
}
