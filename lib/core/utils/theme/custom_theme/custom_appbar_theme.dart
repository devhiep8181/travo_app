// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../color_constant.dart';

class CustomAppbarTheme {
  CustomAppbarTheme._();

  static AppBarTheme lightAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: ColorConstant.transparentColor,
    surfaceTintColor: ColorConstant.transparentColor,
    iconTheme: IconThemeData(color: ColorConstant.blackColor, size: 24),
    actionsIconTheme: IconThemeData(color: ColorConstant.blackColor, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w500,
        color: ColorConstant.whiteColor),
  );


    static AppBarTheme darkAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: ColorConstant.transparentColor,
    surfaceTintColor: ColorConstant.transparentColor,
    iconTheme: IconThemeData(color: ColorConstant.blackColor, size: 24),
    actionsIconTheme: IconThemeData(color: ColorConstant.whiteColor, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: ColorConstant.blackColor),
  );
}
