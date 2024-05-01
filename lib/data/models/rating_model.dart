import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  const RatingModel(
      {required super.comment,
      required super.hotelId,
      required super.photos,
      required super.ratedTime,
      required super.rating,
      required super.emailUser,
      required super.countlike,
      required super.countDislike, 
      required super.uid, 
      });

  factory RatingModel.fromFirestore(DocumentSnapshot doc) {
    return RatingModel(
      comment: doc['Comment']?.toString() ?? '',
      hotelId: doc['Hotel Id']?.toString() ?? '',
      photos: doc['Photos'] as List<dynamic>,
      ratedTime: doc['Rated Time']?.toString() ?? '',
      rating: doc['Rating'] as int,
      emailUser: doc['Email User']?.toString() ?? '',
      countlike: doc['Like'] as int,
      countDislike: doc['Dislike'] as int,
      uid: doc['Uid']?.toString() ?? '',
    );
  }
}
