import '../../models/hotel_model.dart';

abstract class HotelRemoteDatasoure {
  Future<List<HotelModel>> getHotel();
}
