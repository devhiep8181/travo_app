import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';

class BuildChooseFlight extends StatelessWidget {
  const BuildChooseFlight({
    required this.index,
    required this.currentIndex,
    super.key,
  });

  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final listTextData = [
      l10n.oneWayText,
      l10n.roundTripText,
      l10n.multiCityText
    ];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
          color: currentIndex == index
              ? ColorConstant.deepCarrotOrangeColor
              : ColorConstant.grey400Color.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: Text(listTextData[index],
            style: context.appTextTheme.bodyMedium?.copyWith(
                color: currentIndex == index
                    ? ColorConstant.whiteColor
                    : ColorConstant.primaryColor)),
      ),
    );
  }
}
