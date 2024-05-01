import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  const RatingEntity({
    required this.comment,
    required this.hotelId,
    required this.photos,
    required this.ratedTime,
    required this.rating,
    required this.emailUser,
    required this.countlike,
    required this.countDislike,
    required this.uid,
  });
  final String? comment;
  final String? hotelId;
  final List<dynamic>? photos;
  final String? ratedTime;
  final int? rating;
  final String? emailUser;
  final int? countlike;
  final int? countDislike;
  final String uid;

  @override
  List<Object?> get props => [
        comment,
        hotelId,
        photos,
        ratedTime,
        rating,
        emailUser,
        countlike,
        countDislike,
        uid,
      ];
}
