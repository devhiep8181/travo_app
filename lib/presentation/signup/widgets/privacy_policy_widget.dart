// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: l10n.privacyPolicyText1,
              style: theme.bodyMedium?.copyWith(fontSize: 12.sp),
              children: [
                TextSpan(
                  text: l10n.termsText,
                  style: theme.bodyMedium?.copyWith(
                      fontSize: 12.sp, color: ColorConstant.primaryColor),
                ),
                TextSpan(
                    text: l10n.privacyPolicyText2, style: theme.labelMedium),
                TextSpan(
                  text: l10n.privacyText,
                  style: theme.labelMedium
                      ?.copyWith(color: ColorConstant.primaryColor),
                ),
                TextSpan(
                  text: l10n.privacyPolicyText3,
                  style: theme.labelMedium,
                ),
              ])),
    );
  }
}
