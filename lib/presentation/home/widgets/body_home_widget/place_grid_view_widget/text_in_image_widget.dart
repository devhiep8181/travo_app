// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../../../core/app_export.dart';
import '../../../../../domain/entities/place_entity.dart';

class TextInImageWidget extends StatelessWidget {
  const TextInImageWidget({
    required this.index,
    required this.listData,
    super.key,
  });

  final int index;
  final List<PlaceEntity> listData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Positioned(
      //top: customHeightElement(index) - 60.h,
      bottom: 10.h,
      left: 12.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listData[index].name,
            style: theme.bodyLarge?.copyWith(color: ColorConstant.whiteColor),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorConstant.white70Color,
                borderRadius: BorderRadius.circular(8.h)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: ColorConstant.orangeColor,
                  ),
                  Text(listData[index].rating.toString()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
