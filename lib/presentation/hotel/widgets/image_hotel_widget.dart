import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../domain/entities/hotel_entity.dart';
import '../../../widgets/custom_image_view.dart';

class ImageHotelWidget extends StatelessWidget {
  const ImageHotelWidget({
    required this.entityHotel,
    super.key,
  });

  final HotelEntity entityHotel;

  @override
  Widget build(BuildContext context) {

    final checkValue = ValueNotifier<bool>(false);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          CustomImageView(
            fit: BoxFit.fitWidth,
            radius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r)),
            height: 110.h,
            width: double.infinity,
            imagePath: entityHotel.image,
          ),
          ValueListenableBuilder(
            valueListenable: checkValue,
            builder: (_, __, ___) => Positioned(
              right: 2.w,
              child: IconButton(
                  onPressed: () {
                    checkValue.value = !checkValue.value;
                  },
                  icon: checkValue.value
                      ? Icon(
                          Icons.favorite,
                          color: ColorConstant.redColor,
                        )
                      : Icon(
                          Icons.favorite,
                          color: ColorConstant.whiteColor,
                        )),
            ),
          )
        ],
      ),
    );
  }
}
