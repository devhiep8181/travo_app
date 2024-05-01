import 'package:flutter/material.dart';

import '../../core/app_export.dart';


//Với nhiều lựa chọn hơn 2 dùng String thay vì bool
Map<String, dynamic> themeData = {
  'true': AppTheme.darkTheme,
  'false': AppTheme.lightTheme,
};

Map<String, dynamic> languageData = {
  'true' : const Locale('vi'),
  'false' : const Locale('en'),
};
