import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_my_paint.dart';
import 'build_choose_checkout.dart';

class CustomAppBarFlightCheckOutWidget extends StatelessWidget {
  const CustomAppBarFlightCheckOutWidget({
    required this.currentIndex,
    super.key,
  });

  final int currentIndex;
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
              bottom: 20.h,
              left: 16,
              right: 32,
              child: Row(
                children: [
                  const Expanded(child: ButtonWidget()),
                  Expanded(
                    flex: 2,
                    child: Text(
                      context.l10n.checkoutTitle,
                      style: context.appTextTheme.headlineLarge,
                    ),
                  )
                ],
              )),
          Positioned(
            bottom: -10.h,
            child: Row(
              children: List.generate(
                  3,
                  (index) => BuildChooseCheckOut(
                      index: index, currentIndex: currentIndex)),
            ),
          )
        ],
      ),
    );
  }
}
