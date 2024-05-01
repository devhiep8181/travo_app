// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../color_constant.dart';

class CustomTextFieldTheme {
  CustomTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorConstant.greyColor,
    suffixIconColor: ColorConstant.greyColor,
    labelStyle: const TextStyle()
        .copyWith(fontSize: 14, color: ColorConstant.blackColor),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14,
        color: ColorConstant.blackColor,
        fontWeight: FontWeight.w400),
    fillColor: ColorConstant.whiteColor,
    filled: true,
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: ColorConstant.black87Color),
    border: InputBorder.none,
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: ColorConstant.whiteColor)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: ColorConstant.whiteColor)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: ColorConstant.red600Color)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: ColorConstant.red600Color)),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    fillColor: ColorConstant.whiteColor,
    filled: true,
    errorMaxLines: 3,
    prefixIconColor: ColorConstant.blackColor.withOpacity(1.0),
    suffixIconColor: ColorConstant.redColor,
    labelStyle: const TextStyle()
        .copyWith(fontSize: 14.sp, color: ColorConstant.blackColor),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 14.sp, color: ColorConstant.blackColor),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: ColorConstant.whiteColor),
    border: InputBorder.none,
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: ColorConstant.whiteColor)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: ColorConstant.whiteColor)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: ColorConstant.redColor)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: ColorConstant.orangeColor)),
  );
}
