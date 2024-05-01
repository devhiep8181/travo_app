import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';

class TextPopularWidget extends StatelessWidget {
  const TextPopularWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.popularText,
              style: context.appTextTheme.titleLarge?.copyWith(
                  color: context.isAppInLightMode()
                      ? ColorConstant.blackColor
                      : ColorConstant.whiteColor),
            ),
            Text(context.l10n.seeAllText,
                style: context.appTextTheme.bodyMedium
                    ?.copyWith(color: ColorConstant.primaryColor)),
          ],
        ),
      ),
    );
  }
}
