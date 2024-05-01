import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../l10n/l10n.dart';

class BuildChooseCheckOut extends StatelessWidget {
  const BuildChooseCheckOut({
    required this.index,
    required this.currentIndex,
    super.key,
  });

  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final listTextData = [
      l10n.bookAndReviewText,
      l10n.paymentBookingText,
      l10n.confirmText,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10.r,
            backgroundColor: currentIndex == index
                ? ColorConstant.whiteColor
                : ColorConstant.white70Color,
            child: Text(
              '${index + 1}',
              style: theme.bodySmall?.copyWith(
                  color: currentIndex == index
                      ? ColorConstant.primaryColor
                      : ColorConstant.whiteColor),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(listTextData[index],
              style: theme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  color: currentIndex == index
                      ? ColorConstant.whiteColor
                      : ColorConstant.white70Color)),
        ],
      ),
    );
  }
}
