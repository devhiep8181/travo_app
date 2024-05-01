import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_constant.dart';

class DotTicketFlightWidget extends StatelessWidget {
  const DotTicketFlightWidget({
    super.key,
    this.top,
    this.left,
    this.bottom,
    this.right,
    this.color,
  });
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        child: CircleAvatar(
          radius: 12.r,
          backgroundColor:
              color ?? ColorConstant.backroundColor.withOpacity(0.4),
        ));
  }
}