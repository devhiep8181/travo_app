// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../../core/app_export.dart';

import '../../../../core/data/base_remote_datasource_impl.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/custom_image_view.dart';

class ActionAppBarHomeWidget extends StatelessWidget {
  const ActionAppBarHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              BaseRemoteDatasourceImpl()
                  .deleteBooking(uid: '2353801011327@email.hcmulaw.edu.vn', collectionName: 'user');
            },
            icon: Icon(
              TravoAppIcon.bell,
              color: ColorConstant.whiteColor,
            )),
        InkWell(
            onTap: () {
              context.goNamed(userRoute);
            },
            child: CustomImageView(
              height: 40.h,
              width: 50.w,
              border:
                  Border.all(width: 1, color: ColorConstant.transparentColor),
              radius: BorderRadius.circular(18.r),
              imagePath: Assets.images.onboarding2.path,
            )),
      ],
    );
  }
}
