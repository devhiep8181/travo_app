// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../color_constant.dart';

class CustomChipTheme {
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ColorConstant.grey400Color,
    labelStyle: TextStyle(color: ColorConstant.blackColor),
    selectedColor: ColorConstant.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: ColorConstant.whiteColor,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: ColorConstant.whiteColor,
    labelStyle: TextStyle(color: ColorConstant.whiteColor),
    selectedColor: ColorConstant.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: ColorConstant.whiteColor,
  );
}
