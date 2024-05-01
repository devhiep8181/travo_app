// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../core/utils/color_constant.dart';
import '../core/utils/travo_app_icon_icons.dart';
import 'custom_my_paint.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.alignmentTitle,
    this.subtitleWidget,
    this.subtitileText,
    this.fontSizeTitle,
    this.hintLeading = false,
    this.actions,
    this.onPressed,
  });

  final AlignmentGeometry? alignmentTitle;
  final String title;
  final double? fontSizeTitle;
  final Widget? subtitleWidget;
  final String? subtitileText;
  final bool hintLeading;
  final List<Widget>? actions;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return AppBar(
      automaticallyImplyLeading: false, //tắt nút back appbar
      flexibleSpace: CustomPaint(
        painter: CustomMyPaint(),
        child: hintLeading
            ? const SizedBox.shrink()
            : ButtonWidget(
                onPressed: onPressed,
              ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      toolbarHeight: 120.h,
      backgroundColor: ColorConstant.primaryColor,
      actions: actions,
      title: Align(
        alignment: alignmentTitle ?? Alignment.bottomCenter,
        child: Column(
          children: [
            Text(
              title,
              style: theme.headlineLarge?.copyWith(
                fontSize: fontSizeTitle ?? 30.sp,
              ),
            ),
            subtitleWidget ??
                Text(
                  subtitileText ?? '',
                  style: theme.bodyMedium
                      ?.copyWith(color: ColorConstant.whiteColor),
                ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(ScreenUtil.defaultSize.width, 120.h);
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.icon,
    this.alignmentGeometry,
    this.color,
    this.onPressed,
    this.heigh,
    this.width,
    this.sizeIcon,
    this.borderRadius,
  });
  final IconData? icon;
  final AlignmentGeometry? alignmentGeometry;
  final Color? color;
  final void Function()? onPressed;
  final double? heigh;
  final double? width;
  final double? sizeIcon;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry ?? const Alignment(-1.0, -0.5),
      child: IconButton(
        onPressed: onPressed ??
            () {
              context.pop();
            },
        icon: Container(
          width: width ?? 40.w,
          height: heigh ?? 35.h,
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: borderRadius ?? BorderRadius.circular(15.r),
          ),
          child: Icon(
            icon ?? TravoAppIcon.arrow_left,
            size: sizeIcon ?? 18.sp,
            color: color ?? ColorConstant.black87Color,
          ),
        ),
      ),
    );
  }
}
