import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get appTextTheme => Theme.of(this).textTheme;
}

extension AppBrightness on BuildContext {
  bool isAppInLightMode() {
    final themeData = Theme.of(this);
    return themeData.brightness == Brightness.light;
  }

  // bool isAppInDarkMode() {
  //   final brightness = MediaQuery.of(this).platformBrightness;
  //   return brightness == Brightness.dark;
  // }
}
