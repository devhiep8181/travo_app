// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../color_constant.dart';

class CustomBottomSheetTheme {
  CustomBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: ColorConstant.whiteColor,
      modalBackgroundColor: ColorConstant.whiteColor,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: ColorConstant.blackColor,
      modalBackgroundColor: ColorConstant.blackColor,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
}
