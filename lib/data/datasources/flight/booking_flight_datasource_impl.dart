import '../../../core/data/base_remote_datasource.dart';
import '../../models/booking_flight_model.dart';
import 'booking_flight_datasource.dart';

class BookingFlightDatasourceImpl implements BookingFlightDatasource {
  BookingFlightDatasourceImpl({
    required this.baseRemoteDatasource,
  });
  final BaseRemoteDatasource baseRemoteDatasource;
  @override
  Future<void> pushBookingFlight(BookingFlightModel bookingFlightModel) async {
    await baseRemoteDatasource.addBookingFlight(
        creatAt: bookingFlightModel.creatAt ?? '',
        emailUser: bookingFlightModel.emailUser ?? '',
        passengers: bookingFlightModel.passengers ?? 1,
        totalPrice: bookingFlightModel.totalPrice ?? 0,
        promoCode: bookingFlightModel.promoCode ?? '',
        nameGuest: bookingFlightModel.nameGuest ?? [],
        nameAirline: bookingFlightModel.nameAirline ?? '',
        seats: bookingFlightModel.seats ?? [],
        classSeats: bookingFlightModel.classSeats ?? [],
        date: bookingFlightModel.date ?? '',
        typePayment: bookingFlightModel.typePayment ?? '',
        numberCard: bookingFlightModel.numberCard ?? '',
        expDate: bookingFlightModel.expDate ?? '',
        cvv: bookingFlightModel.cvv ?? '',
        country: bookingFlightModel.country ?? '',
        uid: bookingFlightModel.uidBookingFlight ?? '',
        );
  }
}
