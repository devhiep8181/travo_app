// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/export_widgets.dart';
import 'app_bar_home_widget/action_app_bar_home_widget.dart';
import 'app_bar_home_widget/titile_home_widget.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: [
        Positioned(
            bottom: 16,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: ColorConstant.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                  )),
              child: CustomPaint(
                painter: CustomMyPaint(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitileHomeWidget(),
                      ActionAppBarHomeWidget(),
                    ],
                  ),
                ),
              ),
            )),
        Positioned(
          right: 16.0,
          bottom: 0,
          left: 16,
          child: SizedBox(
            height: AppBar().preferredSize.height,
            child: CustomTextFormField(
              filled: true,
              prefix: Icon(
                TravoAppIcon.search,
                color: ColorConstant.grey500Color,
              ),
              hintText: l10n.searchText,
              hintStyle: context.appTextTheme.bodyMedium?.copyWith(
                  color: context.isAppInLightMode()
                      ? ColorConstant.grey500Color
                      : ColorConstant.blackColor),
            ),
          ),
        ),
      ],
    );
  }
}
