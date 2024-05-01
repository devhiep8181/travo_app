import 'package:equatable/equatable.dart';

class HotelEntity extends Equatable{
  const HotelEntity({
    required this.id,
    required this.image,
    required this.price,
    required this.name,
    required this.rating,
    required this.totalReview,
    required this.location,
    required this.information,
    required this.locationDescription,
  });

  final String id; 
  final String image;
  final int? price;
  final String name;
  final double? rating;
  final int? totalReview;
  final String location;
  final String information;
  final String locationDescription;

  @override
  List<Object?> get props => [id, image, price, name, rating, totalReview, location, information, locationDescription];
}
