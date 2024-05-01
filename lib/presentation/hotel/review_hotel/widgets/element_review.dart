import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../domain/entities/rating_entity.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../widgets/info_hotel_widget.dart';
import 'react_widget.dart';

class ElementReview extends StatelessWidget {
  const ElementReview({
    required this.rating,
    required this.index,
    super.key,
  });
  final RatingEntity rating;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomImageView(
                  radius: BorderRadius.circular(12.r),
                  height: 40.h,
                  width: 50.w,
                  imagePath: TextConstant.imageUser,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rating.emailUser.toString(),
                      style: context.appTextTheme.bodyLarge,
                    ),
                    Text(
                      '24 hours ago',
                      style: context.appTextTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: List.generate(
                      5,
                      (index) => Icon(
                            Icons.star,
                            color: index < rating.rating!
                                ? ColorConstant.amberColor
                                : ColorConstant.grey400Color,
                            size: 20.sp,
                          )),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
            child: Text(
              rating.comment ?? '',
              style: context.appTextTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Wrap(
                spacing: 30.w,
                runSpacing: 15.h,
                children: List.generate(rating.photos?.length ?? 1, (index) {
                  return CustomImageView(
                    fit: BoxFit.fitWidth,
                    height: 100.h,
                    width: MediaQuery.of(context).size.width / 3,
                    imagePath: rating.photos?[index] as String? ??
                        Assets.images.onboarding1.path,
                    radius: BorderRadius.circular(12.r),
                  );
                })),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: DashedWidget(),
          ),
          ReactWidget(
            ratingEntity: rating,
            index: index,
          ),
        ],
      ),
    );
  }
}
