
import '../../../core/app_export.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/room_model.dart';
import 'room_remote_datasoure.dart';

class RoomRemoteDatasourceImpl implements RoomRemoteDataSource {
  RoomRemoteDatasourceImpl({required this.baseRemoteDatasource});

  final BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<List<RoomModel>> getRoom({required String hotelId}) async {
    //SỬ DỤNNG BẢNG BĂM => Suy nghĩ thêm về ý tưởng này
    //với key là hotelId
    //value là danh sách các phòng
    //var room = <String, List<RoomModel>>{};
    final listRoomResult = <RoomModel>[];

    final listRoom = await baseRemoteDatasource.getData(
        collectionName: TextConstant.roomCollection,
        fromFirestore: RoomModel.fromFirestore);
    for (final data in listRoom) {
      if (data.hotelId == hotelId) {
        listRoomResult.add(data);
      }
    }
    return listRoomResult;
  }
}
