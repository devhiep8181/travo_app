// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../color_constant.dart';

class CustomElevatedButtonTheme {
  static ElevatedButtonThemeData lightElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstant.whiteColor,
      backgroundColor: ColorConstant.primaryColor,
      disabledForegroundColor: ColorConstant.greyColor,
      disabledBackgroundColor: ColorConstant.greyColor,
      side: BorderSide(color: ColorConstant.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
          fontSize: 16.sp,
          color: ColorConstant.whiteColor,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstant.whiteColor,
      backgroundColor: ColorConstant.primaryColor,
      disabledForegroundColor: ColorConstant.greyColor,
      disabledBackgroundColor: ColorConstant.greyColor,
      side: BorderSide(color: ColorConstant.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
          fontSize: 16.sp,
          color: ColorConstant.whiteColor,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
    ),
  );
}
