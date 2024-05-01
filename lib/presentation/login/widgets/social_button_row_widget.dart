// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/text_constant.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_image_view.dart';

class SocialButtonRowWidget extends StatelessWidget {
  const SocialButtonRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: ColorConstant.whiteColor),
                  backgroundColor: ColorConstant.whiteColor),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Hehehe')));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomImageView(
                    height: 20.h,
                    width: 25.w,
                    imagePath: Assets.images.iconGoogle.path,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    l10n.googleText,
                    style: theme.bodyLarge,
                  )
                ],
              )),
        ),
        SizedBox(
          width: 30.w,
        ),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.btnFacebookColor),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Đố em biết anh đang nghĩ gì ^^')));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomImageView(
                    imagePath: Assets.images.iconFacebook.path,
                    height: 20.h,
                    width: 25.w,
                    fit: BoxFit.fill,
                  ),
                  Text(TextConstant.facebookText)
                ],
              )),
        ),
      ],
    );
  }
}
