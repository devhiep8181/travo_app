import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/flight_entity.dart';

class FlightModel extends FlightEnity {
  const FlightModel(
      {required super.airline,
      required super.arriveTime,
      required super.departureTime,
      required super.fromPlace,
      required super.no,
      required super.price,
      required super.toPlace,
      required super.seat});
  factory FlightModel.fromFirestore(DocumentSnapshot doc) {
    DateTime? arriveDateTime;
    DateTime? departureDateTime;
    arriveDateTime = (doc['arrive_time'] as Timestamp).toDate();
    departureDateTime = (doc['departure_time'] as Timestamp).toDate();
    return FlightModel(
        airline: doc['airline']?.toString() ?? '',
        arriveTime: arriveDateTime,
        departureTime: departureDateTime,
        fromPlace: doc['from_place']?.toString() ?? '',
        no: doc['no']?.toString() ?? ' ',
        price: doc['price'] as int,
        toPlace: doc['to_place']?.toString() ?? '',
        seat: doc['seat'] as List<dynamic>);
  }
}
