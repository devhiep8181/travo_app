import '../../../core/app_export.dart';
import '../../../core/data/base_remote_datasource.dart';
import '../../models/flight_model.dart';
import 'flight_remote_datasoure.dart';

class FlightRemoteDatasourceImpl implements FlightRemoteDatasource {
  FlightRemoteDatasourceImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;
  @override
  Future<List<FlightModel>> getFlight() async {
    final listFlight = await baseRemoteDatasource.getData(
        collectionName: TextConstant.flightCollection,
        fromFirestore: FlightModel.fromFirestore);
    return listFlight;
  }

  @override
  Future<void> updateBookingFlight({
    required String creatAt,
    required String emailUser,
    required int passengers,
    required double totalPrice,
    required String promoCode,
    required List<String> nameGuest,
    required String nameAirline,
    required List<String> seats,
    required List<String> classSeats,
    required String date,
    required String uid,
  }) async {
    await baseRemoteDatasource.updateBookingFlight(
        creatAt: creatAt,
        emailUser: emailUser,
        passengers: passengers,
        totalPrice: totalPrice,
        promoCode: promoCode,
        nameGuest: nameGuest,
        nameAirline: nameAirline,
        seats: seats,
        classSeats: classSeats,
        date: date,
        uid: uid);
  }

  @override
  Future<void> deleteBookingFlight({required String uid}) async {
    await baseRemoteDatasource.deleteBooking(
        uid: uid, collectionName: TextConstant.bookingFlightCollection);
  }
}
