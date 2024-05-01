import '../../domain/entities/guest_flight_enity.dart';

class GuestFlightModel extends GuestFlightEntity {
  const GuestFlightModel(
      {required super.name, required super.seat, required super.classSeat});

 Map<String, dynamic> toFirestore() => {'name': name, 'seat': seat, 'classSeat': classSeat};
}
