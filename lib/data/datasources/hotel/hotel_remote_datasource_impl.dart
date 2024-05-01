import '../../../core/app_export.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/hotel_model.dart';
import 'hotel_remote_datasource.dart';

class HotelRemoteDataSourceImpl implements HotelRemoteDatasoure {
  HotelRemoteDataSourceImpl({
    required this.baseRemoteDatasource,
  });

  final BaseRemoteDatasource baseRemoteDatasource;
  @override
  Future<List<HotelModel>> getHotel() async {
    final lisHotel = await baseRemoteDatasource.getData(
        collectionName: TextConstant.hotelCollection,
        fromFirestore: HotelModel.fromFirestore);
    return lisHotel;
  }
}
