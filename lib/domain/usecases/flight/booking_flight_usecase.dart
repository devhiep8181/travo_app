import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/booking_flight_entity.dart';
import '../../repositories/flight_repository/booking_flight_repository.dart';

class BookingFlightUseCase implements UseCase<void, BookingFlightEntity> {
  BookingFlightUseCase({
    required this.bookingFlightRepository,
  });
  final BookingFlightRepository bookingFlightRepository;

  @override
  Future<Either<Failure, void>> call(BookingFlightEntity params) async {
    return bookingFlightRepository.pushBookingFlight(BookingFlightEntity(
      creatAt: params.creatAt,
      emailUser: params.emailUser,
      passengers: params.passengers,
      totalPrice: params.totalPrice,
      promoCode: params.promoCode,
      nameGuest: params.nameGuest,
      nameAirline: params.nameAirline,
      seats: params.seats,
      classSeats: params.classSeats,
      date: params.date,
      typePayment: params.typePayment,
      numberCard: params.numberCard,
      expDate: params.expDate,
      cvv: params.cvv,
      country: params.country,
      uidBookingFlight: params.uidBookingFlight,
    ));
  }
}
