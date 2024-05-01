import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../domain/entities/hotel_entity.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_eleveted_button.dart';

class InfoHotelWidget extends StatelessWidget {
  const InfoHotelWidget({
    required this.entityHotel,
    super.key,
  });

  final HotelEntity entityHotel;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entityHotel.name,
            style: context.appTextTheme.headlineSmall,
          ),
          SizedBox(
            height: 8.h,
          ),
          LocationWidget(entityHotel: entityHotel),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: ColorConstant.orangeColor,
              ),
              Text(
                '${entityHotel.rating} ',
              ),
              Text(
                '(${entityHotel.totalReview} ${TextConstant.reviewsText})',
                style: context.appTextTheme.bodyMedium
                    ?.copyWith(color: ColorConstant.grey400Color),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          const DashedWidget(),
          SizedBox(
            height: 12.h,
          ),
          BottomCardHotelWidget(
            price: entityHotel.price.toString(),
            buttonText: context.l10n.bookARoomText,
            onPressed: () {
              context.goNamed(detailHotelRoute, extra: entityHotel);
            },
          ),
        ],
      ),
    );
  }
}

class DashedWidget extends StatelessWidget {
  const DashedWidget(
      {super.key, this.height = 1, this.color = Colors.grey, this.direction});
  final double height;
  final Color color;
  final Axis? direction;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction ?? Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    required this.entityHotel,
    super.key,
  });

  final HotelEntity entityHotel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        const Icon(
          Icons.place,
          color: Colors.red,
        ),
        Text(entityHotel.location, style: theme.bodyMedium),
      ],
    );
  }
}

class BottomCardHotelWidget extends StatelessWidget {
  const BottomCardHotelWidget({
    required this.price,
    required this.buttonText,
    required this.onPressed,
    this.hiddenText = true,
    super.key,
  });
  final String price;
  final String buttonText;
  final VoidCallback onPressed;
  final bool hiddenText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              '\$$price',
              style: theme.headlineSmall,
            ),
            Text(
              l10n.nightText,
              style: theme.bodySmall,
            ),
          ],
        ),
        SizedBox(width: 70.w),
        if (hiddenText)
          Flexible(
            fit: FlexFit.tight,
            child: CustomElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          )
        else
          const Text(
            '1 room',
          ),
      ],
    );
  }
}
