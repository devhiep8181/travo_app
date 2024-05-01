import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/text_constant.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../../../widgets/custom_my_paint.dart';
import '../../select_seat/blocs/chooose_class_flight/choose_class_flight_bloc.dart';
import '../../select_seat/blocs/choose_date_flight/choose_date_flight_bloc.dart';
import '../../select_seat/blocs/choose_location/choose_location_bloc.dart';

class AppBarResutFlightWidget extends StatelessWidget {
  const AppBarResutFlightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: false,
      expandedHeight: 120.h,
      backgroundColor: ColorConstant.primaryColor,
      flexibleSpace: Stack(
        children: [
          Container(
            color: ColorConstant.primaryColor,
            width: MediaQuery.of(context).size.width,
            height: 110.h,
            child: CustomPaint(
              painter: CustomMyPaint(),
            ),
          ),
          Positioned(
              bottom: 25,
              left: 16,
              right: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ButtonWidget(),
                  Row(
                    children: [
                      _nameLocationFlight(checkLocationFrom: true),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: 25.w,
                          height: 2.h,
                          decoration:
                              BoxDecoration(color: ColorConstant.whiteColor)),
                      CustomImageView(
                        imagePath: Assets.images.flightCopy.path,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: 25.w,
                          height: 2.h,
                          decoration:
                              BoxDecoration(color: ColorConstant.whiteColor)),
                      _nameLocationFlight(checkLocationFrom: false),
                    ],
                  ),
                  const ButtonWidget(
                    icon: Icons.menu,
                  ),
                ],
              )),
          Positioned(
              bottom: -10,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(builder: (context) {
                    final dateValue =
                        context.watch<ChooseDateFlightBloc>().state;
                    return Text(
                      dateValue.depatureDate[TextConstant.keyDepatureFlight1]
                          .toString(),
                      style: theme.bodyMedium
                          ?.copyWith(color: ColorConstant.whiteColor),
                    );
                  }),
                  Icon(
                    Icons.fiber_manual_record,
                    size: 10,
                    color: ColorConstant.whiteColor,
                  ),
                  Text(
                    '1 Adult',
                    style: theme.bodyMedium
                        ?.copyWith(color: ColorConstant.whiteColor),
                  ),
                  Icon(
                    Icons.fiber_manual_record,
                    size: 10,
                    color: ColorConstant.whiteColor,
                  ),
                  Builder(builder: (context) {
                    final classFlightValue =
                        context.watch<ChooseClassFlightBloc>().state;
                    return Text(
                      classFlightValue.valueClassFlight[1].toString(),
                      style: theme.bodyMedium
                          ?.copyWith(color: ColorConstant.whiteColor),
                    );
                  }),
                  IconButton(
                      onPressed: () {},
                      icon: Container(
                          width: 25.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: ColorConstant.whiteColor,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: const Center(
                              child: Icon(Icons.keyboard_arrow_down))))
                ],
              )),
        ],
      ),
    );
  }

  Builder _nameLocationFlight({required bool checkLocationFrom}) {
    return Builder(builder: (context) {
      final locationValue = context.watch<ChooseLocationBloc>().state;

      return SizedBox(
        width: 50.w,
        child: Text(
          checkLocationFrom
              ? locationValue.locationFromName[TextConstant.keyLocationFlight1]
                  .toString()
              : locationValue.locationToName[TextConstant.keyLocationFlight1]
                  .toString(),
          style: context.appTextTheme.titleLarge
              ?.copyWith(color: ColorConstant.whiteColor, fontSize: 14.sp),
          overflow: TextOverflow.visible,
          maxLines: 1,
        ),
      );
    });
  }
}
