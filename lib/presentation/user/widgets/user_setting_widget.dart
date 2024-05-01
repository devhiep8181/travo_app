import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';

class UserSettingWidget extends StatelessWidget {
  const UserSettingWidget({
    required this.leadingText,
    required this.action,
    super.key,
  });

  final String leadingText;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(leadingText,
                  style: context.appTextTheme.bodyMedium),
              action,
            ],
          ),
        ),
      ),
    );
  }
}
