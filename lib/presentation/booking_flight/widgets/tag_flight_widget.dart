import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../../booking/widgets/custom_tag_checkout_widget.dart';

class TagFlightWidget extends StatelessWidget {
  const TagFlightWidget({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.addBtn = false,
    this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final void Function()? onTap;
  final bool addBtn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                margin: EdgeInsets.only(right: 16.w),
                imagePath: imagePath,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(
                    height: 5.h,
                  ),
                  if (addBtn)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: BtnAddInfoBookingWidget(
                          onTap: onTap, textBtn: subtitle),
                    )
                  else
                    Text(
                      subtitle,
                      style: theme.bodyLarge,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}