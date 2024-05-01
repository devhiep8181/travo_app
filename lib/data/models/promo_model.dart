import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/promo_entity.dart';

class PromoModel extends PromoEntity {
  const PromoModel(
      {required super.code,
      required super.endow,
      required super.imgae,
      required super.price});
      
  factory PromoModel.fromFireStore(DocumentSnapshot doc) {
    return PromoModel(
        code: doc['code']?.toString(),
        endow: doc['endow']?.toString(),
        imgae: doc['image']?.toString(),
        price: doc['price'] as double);
  }
}
