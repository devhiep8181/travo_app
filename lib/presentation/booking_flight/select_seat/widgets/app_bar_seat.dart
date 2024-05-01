import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_my_paint.dart';

class AppBarSeatWidget extends StatelessWidget {
  const AppBarSeatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
              right: 32,
              child: Row(
                children: [
                  const Expanded(child: ButtonWidget()),
                  Expanded(
                    flex: 2,
                    child: Text(
                      l10n.selectSeatText,
                      style: context.appTextTheme.headlineLarge,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
