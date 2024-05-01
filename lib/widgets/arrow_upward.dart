import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/color_constant.dart';

class ArrowUpward extends StatelessWidget {
  const ArrowUpward({
    required this.onTap,
    super.key,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: ColorConstant.primaryColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20.r)),
        child: Icon(
          Icons.arrow_upward,
          size: 30.sp,
          color: ColorConstant.whiteColor,
        ),
      ),
    );
  }
}
