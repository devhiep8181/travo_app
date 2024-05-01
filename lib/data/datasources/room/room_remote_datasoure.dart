import '../../models/room_model.dart';

abstract class RoomRemoteDataSource {
  Future<List<RoomModel>> getRoom({required String hotelId});
}
