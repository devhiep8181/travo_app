import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/room_entity.dart';

class RoomModel extends RoomEntity {
  const RoomModel(
      {required super.hotelId,
      required super.maxGuest,
      required super.image,
      required super.name,
      required super.price,
      required super.services,
      required super.total,
      required super.typePrice});
  

  factory RoomModel.fromFirestore(DocumentSnapshot doc) {
    return RoomModel(
        hotelId: doc['hotel'] as String,
        maxGuest: doc['max_guest'] as int,
        image: doc['image'] as String,
        name: doc['name'] as String,
        price: doc['price'] as int,
        services: doc['services'] as List<dynamic>,
        total: doc['total'] as int,
        typePrice: doc['type_price'] as String);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'hotel': hotelId,
      'max_guest': maxGuest,
      'image': image,
      'name': name,
      'price': price,
      'services': services,
      'total': total,
      'type_price': typePrice
    };
  }
}
