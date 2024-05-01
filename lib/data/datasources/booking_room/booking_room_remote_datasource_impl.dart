import '../../../core/app_export.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/booking_model.dart';
import 'booking_room_remote_datasource.dart';

class BookingRoomRemoteDataSourceImpl implements BookingRoomRemoteDataSource {
  BookingRoomRemoteDataSourceImpl({
    required this.baseRemoteDatasource,
  });
  BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<List<BookingModel>> getBookingRoom({required String email}) async {
    final listBookingRoom = await baseRemoteDatasource.getDataWithEmail(
        collectionName: TextConstant.bookingCollection,
        email: email,
        fromFirestore: BookingModel.fromFirestore);
    print('length: ${listBookingRoom.length}');
    return listBookingRoom;
  }

  @override
  Future<void> updateBookingRoom(
      {required String creatAt,
      required String checkIn,
      required String checkOut,
      required String emailGuest,
      required String nameGuest,
      required String idHotel,
      required String phoneGuest,
      required String nameRoom,
      required String imageRoom,
      required String uid}) async {
    await baseRemoteDatasource.updateBooking(
        creatAt: creatAt,
        checkIn: checkIn,
        checkOut: checkOut,
        emailGuest: emailGuest,
        nameGuest: nameGuest,
        idHotel: idHotel,
        phoneGuest: phoneGuest,
        nameRoom: nameRoom,
        imageRoom: imageRoom,
        uid: uid);
  }

  @override
  Future<void> deleteBookingRoom({required String uid}) async {
    await baseRemoteDatasource.deleteBooking(
        uid: uid, collectionName: TextConstant.bookingCollection);
  }
}
