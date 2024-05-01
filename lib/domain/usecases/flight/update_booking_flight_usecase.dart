import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/flight_repository/flight_repository.dart';

class UpdateBookingFlightUseCase
    implements UseCase<void, UpdateBookingFlightParams> {
  UpdateBookingFlightUseCase({required this.flightRepository});
  final FlightRepository flightRepository;

  @override
  Future<Either<Failure, void>> call(UpdateBookingFlightParams params) async {
    return flightRepository.updateBookingFlight(
      creatAt: params.creatAt ?? '',
      emailUser: params.emailUser ?? '',
      passengers: params.passengers ?? 0,
      totalPrice: params.totalPrice ?? 0,
      promoCode: params.promoCode ?? '',
      nameGuest: params.nameGuest ?? [],
      nameAirline: params.nameAirline ?? '',
      seats: params.seats ?? [],
      classSeats: params.classSeats ?? [],
      date: params.date ?? '',
      uid: params.uid ?? '',
    );
  }
}

class UpdateBookingFlightParams extends Equatable {
  const UpdateBookingFlightParams({
    required this.creatAt,
    required this.emailUser,
    required this.passengers,
    required this.totalPrice,
    required this.promoCode,
    required this.nameGuest,
    required this.nameAirline,
    required this.seats,
    required this.classSeats,
    required this.date,
    required this.uid,
  });
  final String? creatAt;
  final String? emailUser;
  final int? passengers;
  final double? totalPrice;
  final String? promoCode;
  final List<String>? nameGuest;
  final String? nameAirline;
  final List<String>? seats;
  final List<String>? classSeats;
  final String? date;
  final String? uid;

  @override
  List<Object?> get props => [
        creatAt,
        emailUser,
        passengers,
        totalPrice,
        promoCode,
        nameGuest,
        nameAirline,
        seats,
        classSeats,
        uid
      ];
}
