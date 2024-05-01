import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_my_paint.dart';

class AppBarLabelWidget extends StatelessWidget {
  const AppBarLabelWidget({
    required this.title,
    super.key,

  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: false,
      expandedHeight: 100.h,
      backgroundColor: ColorConstant.primaryColor,
      flexibleSpace: Stack(
        children: [
          Positioned(
            bottom: 10,
            child: Container(
              color: ColorConstant.primaryColor,
              width: MediaQuery.of(context).size.width,
              height: 100.h,
              child: CustomPaint(
                painter: CustomMyPaint(),
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 16,
              right: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: context.appTextTheme.headlineLarge,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
