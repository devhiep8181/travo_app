import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/name_route.dart';
import '../blocs/modify_review/modify_review_bloc.dart';

class FloatingActionReviewWidget extends StatelessWidget {
  const FloatingActionReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ModifyReviewBloc>().add(NoModifyReviewEvent());
        context.goNamed(writeReviewHotelRoute);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: CircleAvatar(
          radius: 30.r,
          backgroundColor: ColorConstant.primaryColor.withOpacity(0.8),
          child: Icon(
            Icons.edit,
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
