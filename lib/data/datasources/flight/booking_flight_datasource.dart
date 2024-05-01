import '../../models/booking_flight_model.dart';

abstract class BookingFlightDatasource {
  Future<void> pushBookingFlight(BookingFlightModel bookingFlightModel);
}
