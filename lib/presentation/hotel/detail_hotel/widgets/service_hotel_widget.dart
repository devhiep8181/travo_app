import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../select_room/data/select_room_data.dart';

class ServiceHotelWidget extends StatelessWidget {
  const ServiceHotelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          final data = selectRoomData[keyServices[index]];
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: data?[TextConstant.keyColor] as Color?,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: index == 4
                      ? EdgeInsets.symmetric(horizontal: 11.w, vertical: 14.h)
                      : EdgeInsets.all(8.h),
                  child: CustomImageView(
                      imagePath: data?[TextConstant.keyImage].toString()),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                data?[TextConstant.keyTitle] as String,
                style: theme.bodySmall?.copyWith(fontSize: 12.sp),
              ),
              Text(
                data?[TextConstant.keySubtitle] as String,
                style: theme.bodySmall?.copyWith(fontSize: 12.sp),
              ),
            ],
          );
        }));
  }
}
