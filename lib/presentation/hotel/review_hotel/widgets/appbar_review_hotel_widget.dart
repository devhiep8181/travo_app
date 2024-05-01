import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_my_paint.dart';

class AppBarReviewHotelWidget extends StatelessWidget {
  const AppBarReviewHotelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: false,
      expandedHeight: 120.h,
      backgroundColor: ColorConstant.primaryColor,
      flexibleSpace: Stack(
        children: [
          Container(
            color: ColorConstant.primaryColor,
            width: MediaQuery.of(context).size.width,
            height: 100.h,
            child: CustomPaint(
              painter: CustomMyPaint(),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ButtonWidget(),
                  Text(
                    'Reviews',
                    style: context.appTextTheme.headlineLarge,
                  ),
                  const ButtonWidget(
                    icon: Icons.menu,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
