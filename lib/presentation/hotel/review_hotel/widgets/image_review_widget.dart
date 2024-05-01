import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';

class ImageReviewWidget extends StatelessWidget {
  const ImageReviewWidget({
    required this.icon,
    required this.title,
    required this.onPressed,
    super.key,
  });
  final IconData? icon;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 35.h,
            width: 45.w,
            decoration: BoxDecoration(
                color: ColorConstant.primaryColor,
                borderRadius: BorderRadius.circular(12.r)),
            child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: ColorConstant.whiteColor,
                ))),
        Text(
          title,
          style: context.appTextTheme.bodyLarge,
        ),
      ],
    );
  }
}