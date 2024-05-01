import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../blocs/modify_review/modify_review_bloc.dart';
import 'media_widget.dart';
import 'rating_star_widget.dart';

class ContentWriteReview extends StatelessWidget {
  const ContentWriteReview({
    required this.comment,
    super.key,
  });
  final TextEditingController comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Write Review',
              style: context.appTextTheme.bodyLarge,
            ),
            SizedBox(
              height: 8.h,
            ),
            const RatingStarWidget(),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Review Details',
              style: context.appTextTheme.bodyLarge,
            ),
            SizedBox(
              height: 8.h,
            ),
            BlocBuilder<ModifyReviewBloc, ModifyReviewState>(
              builder: (context, state) {
                if (state.modifyReviewStatus.isLoaded) {
                  if (state.modify) {
                    comment.text = state.rating.comment ?? '';
                  } else {
                    comment.text = '';
                  }
                }
                return TextFormField(
                  maxLength: 5000,
                  maxLines: 10,
                  controller: comment,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(
                              color: ColorConstant.grey500Color, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(
                              color: ColorConstant.grey500Color, width: 1))),
                );
              },
            ),
            const MediaWidget(),
          ],
        ),
      ),
    );
  }
}
