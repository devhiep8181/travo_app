import 'package:equatable/equatable.dart';

class PromoEntity extends Equatable {
  const PromoEntity({
    required this.code,
    required this.endow,
    required this.imgae,
    required this.price,
  });
  final String? code;
  final String? endow;
  final String? imgae;
  final double? price;

  @override
  List<Object?> get props => [code, endow, imgae, price];
}
