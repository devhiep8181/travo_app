import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../domain/entities/hotel_entity.dart';
import '../../../../l10n/l10n.dart';

class ReviewsHotelWidget extends StatelessWidget {
  const ReviewsHotelWidget({
    required this.hotelEntity,
    super.key,
  });

  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: ColorConstant.orangeColor,
            ),
            Text(
              '${hotelEntity.rating}/5 ',
            ),
            Text(
              '(${hotelEntity.totalReview} ${l10n.reviewsText})',
            ),
          ],
        ),
        Text(
          l10n.seeAllText,
          style: theme.bodyMedium?.copyWith(color: ColorConstant.primaryColor),
        ),
      ],
    );
  }
}
