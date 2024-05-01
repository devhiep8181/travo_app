// Dart imports:
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PlaceEntity extends Equatable{

  factory PlaceEntity.fromJson(String source) => PlaceEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  factory PlaceEntity.fromMap(Map<String, dynamic> map) {
    return PlaceEntity(
      image: map['image'].toString(),
      rating: map['rating'] as double,
      name: map['name'].toString(),
    );
  }
  const PlaceEntity({
    required this.rating,
    required this.name,
    required this.image,
  });
  final String? image;
  final double? rating;
  final String name;


  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'rating': rating,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [image, rating, name];
}
