import '../../models/flight_model.dart';

abstract class FlightRemoteDatasource {
  Future<List<FlightModel>> getFlight();

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
  });

  Future<void> deleteBookingFlight({required String uid});
}
