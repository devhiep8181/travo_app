import '../../models/booking_flight_model.dart';

abstract class GetBookingFlightRemoteDatasource{
  Future<List<BookingFlightModel>> getBookingFlight({required String email});
}
