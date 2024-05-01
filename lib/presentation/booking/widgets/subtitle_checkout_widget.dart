import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';

class SubtitleCheckoutWidget extends StatelessWidget {
  const SubtitleCheckoutWidget({
    super.key,
    this.colorBackground,
    this.textColor,
    this.indexPage,
  });
  final int? indexPage;
  final Color? colorBackground;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 10.r,
            backgroundColor: indexPage == 1
                ? ColorConstant.whiteColor
                : ColorConstant.white70Color.withOpacity(0.4),
            child: Text(
              '1',
              style: indexPage == 1
                  ? theme.labelLarge?.copyWith(
                      color: textColor ?? ColorConstant.primaryColor,
                    )
                  : theme.labelLarge?.copyWith(
                      fontSize: 12.sp,
                      color: textColor ?? ColorConstant.whiteColor,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 6.w),
            child: Text('Book and Review',
                style:
                    theme.bodySmall?.copyWith(color: ColorConstant.whiteColor)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: Container(
              height: 2,
              width: 20,
              color: ColorConstant.whiteColor,
            ),
          ),
          CircleAvatar(
            radius: 10.r,
            backgroundColor: indexPage == 2
                ? ColorConstant.whiteColor
                : ColorConstant.white70Color.withOpacity(0.4),
            child: Text(
              '2',
              style: indexPage == 2
                  ? theme.labelLarge?.copyWith(
                      color: textColor ?? ColorConstant.primaryColor,
                    )
                  : theme.labelLarge?.copyWith(
                      color: textColor ?? ColorConstant.whiteColor,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 6.w),
            child: Text('Payment',
                style:
                    theme.bodySmall?.copyWith(color: ColorConstant.whiteColor)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: Container(
              height: 2,
              width: 20,
              color: ColorConstant.whiteColor,
            ),
          ),
          CircleAvatar(
            radius: 10.r,
            backgroundColor: indexPage == 3
                ? ColorConstant.whiteColor
                : ColorConstant.white70Color.withOpacity(0.4),
            child: Text(
              '3',
              style: indexPage == 3
                  ? theme.labelLarge?.copyWith(
                      color: textColor ?? ColorConstant.primaryColor,
                    )
                  : theme.labelLarge?.copyWith(
                      color: textColor ?? ColorConstant.whiteColor,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 6.w),
            child: Text(
              'Confirm',
              style: theme.bodySmall?.copyWith(
                color: ColorConstant.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
