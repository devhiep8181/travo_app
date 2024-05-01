import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/export_widgets.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(title: l10n.promoCodeText),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: l10n.addCouponCodeText,
              suffix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: ColorConstant.greyColor.withOpacity(0.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(l10n.addCodeBtnText),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomElevatedButton(
              textBtn: l10n.doneBtnText,
            ),
          ],
        ),
      ),
    );
  }
}
