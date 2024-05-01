// Dart imports:

// Project imports:
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/place_entity.dart';

class PlaceModel extends PlaceEntity {

  const PlaceModel(
      {required super.rating, required super.name, required super.image});
  factory PlaceModel.fromFirestore(DocumentSnapshot doc) {
    return PlaceModel(
      image: doc['image'] as String,
      rating: doc['rating'] as double,
      name: doc['name'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'image': image,
      'rating': rating,
      'name': name,
    };
  }
}
