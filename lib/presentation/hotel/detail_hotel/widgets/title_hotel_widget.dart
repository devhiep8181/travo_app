import 'package:flutter/material.dart';

import '../../../../domain/entities/hotel_entity.dart';
import '../../../../l10n/l10n.dart';

class TitleHotelWidget extends StatelessWidget {
  const TitleHotelWidget({
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
        Expanded(
            child: Text(
          hotelEntity.name,
          style: theme.headlineSmall,
        )),
        Text('\$${hotelEntity.price}', style: theme.headlineSmall),
        Text(
          l10n.nightText,
          style: theme.bodySmall,
        ),
      ],
    );
  }
}
