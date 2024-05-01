import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  const RoomEntity({
    required this.hotelId,
    required this.maxGuest,
    required this.image,
    required this.name,
    required this.price,
    required this.services,
    required this.total,
    required this.typePrice,
  });
  final String hotelId;
  final int? maxGuest;
  final String image;
  final String name;
  final int price;
  final List<dynamic> services;
  final int? total;
  final String? typePrice;

  @override
  List<Object?> get props =>
      [hotelId, maxGuest, image, name, price, services, total, typePrice];
}
