// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../color_constant.dart';

class CustomOutlineButtonTheme {
  CustomOutlineButtonTheme._();

  static OutlinedButtonThemeData lightOutlineButtonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              elevation: 0,
              foregroundColor: ColorConstant.blackColor,
              side: BorderSide(color: ColorConstant.primaryColor),
              textStyle: TextStyle(
                  fontSize: 16,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w600),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14))));

  static OutlinedButtonThemeData darkOutlineButtonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              elevation: 0,
              foregroundColor: ColorConstant.whiteColor,
              side: BorderSide(color: ColorConstant.primaryColor),
              textStyle: TextStyle(
                  fontSize: 16,
                  color: ColorConstant.whiteColor,
                  fontWeight: FontWeight.w600),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14))));
}
