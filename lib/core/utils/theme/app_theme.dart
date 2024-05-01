// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../color_constant.dart';
import 'custom_theme/export_custom_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Rubik',
    brightness: Brightness.light,
    primaryColor: ColorConstant.primaryColor,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    scaffoldBackgroundColor: ColorConstant.grey200Color,
    appBarTheme: CustomAppbarTheme.lightAppbarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonThemeData,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.lightOutlineButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Rubik',
      brightness: Brightness.dark,
      primaryColor: ColorConstant.primaryColor,
      textTheme: CustomTextTheme.darkTextTheme,
      chipTheme: CustomChipTheme.darkChipTheme,
      scaffoldBackgroundColor: ColorConstant.blackColor,
      appBarTheme: CustomAppbarTheme.darkAppbarTheme,
      bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme:
          CustomElevatedButtonTheme.darkElevatedButtonThemeData,
      inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
      outlinedButtonTheme: CustomOutlineButtonTheme.darkOutlineButtonTheme);
}
