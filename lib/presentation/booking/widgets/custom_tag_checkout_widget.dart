import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../payment/bloc/choose_card/bloc/choose_card_bloc.dart';

class CustomTagCheckoutWidget extends StatelessWidget {
  const CustomTagCheckoutWidget({
    required this.textTitleTag,
    required this.imagePath,
    required this.onTap,
    this.textBtn,
    super.key,
    this.hiddenBtn = false,
    this.hiddenDotTopRight = true,
    this.padding,
  });
  final String textTitleTag;
  final String? textBtn;
  final String imagePath;
  final bool hiddenBtn;
  final bool hiddenDotTopRight;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final dotValue = context
        .select((ChooseCardBloc bloc) => bloc.state.chooseCard.entries.first);
    //print('dotValue: ${dotValue.key} : ${dotValue.value}');
    return Padding(
      padding: padding ??
          EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h, bottom: 16.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomImageView(
                          height: 40.h,
                          width: 40.w,
                          imagePath: imagePath,
                          radius: BorderRadius.circular(12.r))),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        textTitleTag,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: ColorConstant.black87Color),
                      ),
                    ),
                  ),
                  if (hiddenDotTopRight)
                    const SizedBox()
                  else
                    CircleAvatar(
                      backgroundColor:
                          dotValue.key == textTitleTag && dotValue.value == true
                              ? ColorConstant.greenColor
                              : ColorConstant.grey500Color.withOpacity(0.5),
                      radius: 12.r,
                    ),
                ],
              ),
              if (hiddenBtn) const SizedBox() else SizedBox(height: 20.h),
              if (hiddenBtn)
                const SizedBox()
              else
                BtnAddInfoBookingWidget(onTap: onTap, textBtn: textBtn),
            ],
          ),
        ),
      ),
    );
  }
}

class BtnAddInfoBookingWidget extends StatelessWidget {
  const BtnAddInfoBookingWidget({
    required this.onTap,
    required this.textBtn,
    super.key,
  });

  final void Function()? onTap;
  final String? textBtn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 200.w,
        decoration: BoxDecoration(
          color: ColorConstant.grey400Color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Icon(
                    Icons.add,
                    color: ColorConstant.black87Color.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                textBtn ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: ColorConstant.blueVioletColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
