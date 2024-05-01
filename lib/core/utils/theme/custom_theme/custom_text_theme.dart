// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../color_constant.dart';

class CustomTextTheme {
  CustomTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.whiteColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ColorConstant.whiteColor,
    ),
    labelMedium: const TextStyle().copyWith(
      height: 2,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.whiteColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstant.blackColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ColorConstant.whiteColor,
    ),
    labelMedium: const TextStyle().copyWith(
      height: 2,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
    ),
  );
}
