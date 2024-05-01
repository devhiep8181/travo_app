import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/hotel_entity.dart';

class HotelModel extends HotelEntity {
  const HotelModel(
      {required super.id,
      required super.image,
      required super.price,
      required super.name,
      required super.rating,
      required super.totalReview,
      required super.location,
      required super.information,
      required super.locationDescription});

  factory HotelModel.fromFirestore(DocumentSnapshot doc) {
    return HotelModel(
      id: doc.id,
      image: doc['image']?.toString() ?? '',
      price: doc['price'] as int,
      name: doc['name']?.toString() ?? '',
      rating: doc['rating'] as double,
      totalReview: doc['total_review'] as int,
      location: doc['location']?.toString() ?? '',
      information: doc['information']?.toString() ?? '',
      locationDescription: doc['location_description']?.toString() ?? '',
    );
  }

   Map<String, dynamic> toFirestore() {
    return {
        'id' : id,
        'image': image,
        'price': price,
        'name' : name,
        'rating' : rating,
        'total_review': totalReview,
        'location' : location,
        'information' : information,
        'location_description' : locationDescription,
    };
  }
}
