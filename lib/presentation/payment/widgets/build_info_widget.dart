import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/color_constant.dart';

class BuildInfoWidget extends StatelessWidget {
  const BuildInfoWidget({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          child: Icon(
            icon,
            color: ColorConstant.primaryColor,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          '$label $value',
          style: TextStyle(
            color: ColorConstant.black87Color.withOpacity(0.9),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
