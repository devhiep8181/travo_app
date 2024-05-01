import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';

class InfoTagModifyWidget extends StatelessWidget {
  const InfoTagModifyWidget({
    required this.title,
    super.key,
    this.style,
  });
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Text(title, style: style ?? context.appTextTheme.titleMedium),
        ),
        CircleAvatar(
            radius: 30.r,
            backgroundColor: ColorConstant.salmonPinkColor,
            child: Icon(
              Icons.mode_edit,
              color: ColorConstant.whiteColor,
            ))
      ],
    );
  }
}


