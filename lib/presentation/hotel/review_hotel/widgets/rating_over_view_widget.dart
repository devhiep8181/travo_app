import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../blocs/review/review_bloc.dart';

class RatingOverViewWidget extends StatelessWidget {
  const RatingOverViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 100.h,
        decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          children: [
            BlocBuilder<ReviewBloc, ReviewState>(
              builder: (context, state) {
                final valueCheck = state.reviewStatus.isLoaded;
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        valueCheck ? state.rating.toString() : '4.0',
                        style: context.appTextTheme.headlineLarge?.copyWith(
                            fontSize: 30.sp, color: ColorConstant.primaryColor),
                      ),
                      Text(
                        'of 5',
                        style: context.appTextTheme.bodyMedium,
                      ),
                      Text(
                        valueCheck ? '(${state.totalReview} Reviews)' : '(9876 Reviews)',
                        style: context.appTextTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  CustomImageView(
                      height: 100.h, imagePath: Assets.images.comment),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
