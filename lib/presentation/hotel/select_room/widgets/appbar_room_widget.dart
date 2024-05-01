import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/export_widgets.dart';

class AppBarRoomWidget extends StatelessWidget {
  const AppBarRoomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
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
              right: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ButtonWidget(),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    l10n.selectRoomText,
                    style: theme.headlineLarge,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
