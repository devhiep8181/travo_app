import '../../../core/app_export.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/booking_flight_model.dart';
import 'get_booking_flight_remote_datasource.dart';

class GetBookingFlightRemoteDatasourceImpl
    implements GetBookingFlightRemoteDatasource {
  GetBookingFlightRemoteDatasourceImpl({required this.baseRemoteDatasource});
  final BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<List<BookingFlightModel>> getBookingFlight(
      {required String email}) async {
    final listBookingFligth = await baseRemoteDatasource.getDataWithEmail(
        collectionName: TextConstant.bookingFlightCollection,
        email: email,
        fromFirestore: BookingFlightModel.fromFirestore);
    return listBookingFligth;
  }
}
