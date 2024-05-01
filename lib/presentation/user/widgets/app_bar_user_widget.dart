import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_my_paint.dart';
import '../../booking/book_and_review/blocs/contact/contact_bloc.dart';

class AppBarUserWidget extends StatelessWidget {
  const AppBarUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorConstant.primaryColor,
      title: Center(child: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state.contactStatus.isLoaded) {
            return Text(
              '${context.l10n.hiText}${state.userEnity.displayName}',
              style: context.appTextTheme.headlineMedium?.copyWith(
                fontSize: 18.sp,
                color: ColorConstant.whiteColor,
              ),
            );
          }
          return Text(
            '${context.l10n.hiText} CP0',
            style: context.appTextTheme.headlineMedium?.copyWith(
              fontSize: 18.sp,
              color: ColorConstant.whiteColor,
            ),
          );
        },
      )),
      pinned: true,
      expandedHeight: 130.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
              color: ColorConstant.primaryColor,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(30.r))),
          height: 130.h,
          child: CustomPaint(
            painter: CustomMyPaint(),
            child: Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundColor: ColorConstant.transparentColor,
                      child: CircleAvatar(
                        radius: 50.r,
                        child: CustomImageView(
                            border: Border.all(
                                width: 1,
                                color: ColorConstant.transparentColor),
                            radius: BorderRadius.circular(100.r),
                            imagePath: Assets.images.onboarding2.path),
                      ),
                    ),
                    Positioned(
                        right: 5,
                        bottom: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.whiteColor,
                              borderRadius: BorderRadius.circular(100.r)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                color:
                                    ColorConstant.black87Color.withOpacity(0.7),
                              )),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
