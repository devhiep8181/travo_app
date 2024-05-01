import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/name_route.dart';
import '../../../core/utils/travo_app_icon_icons.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_my_paint.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../payment/blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../blocs/hotel/hotel_bloc.dart';
import 'show_bottom_fliter_room_widget.dart';

class AppBarHotelWidget extends StatelessWidget {
  const AppBarHotelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    final modifyRoomBooking = context
        .select((ModifyOrChooseRoomBloc bloc) => bloc.state.modifyBookingRoom);
    return SliverAppBar(
        pinned: true,
        expandedHeight: 130.h,
        flexibleSpace: Stack(
          children: [
            Positioned(
                bottom: 16,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                      )),
                  child: CustomPaint(
                    painter: CustomMyPaint(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonWidget(
                            alignmentGeometry: Alignment.centerLeft,
                            onPressed: () {
                              if (modifyRoomBooking) {
                                context.goNamed(modifyBookingRoomRoute);
                              } else {
                                context.goNamed(homeRoute);
                              }
                            },
                          ),
                          Text(
                           context.l10n.hotelModelText,
                            style: context.appTextTheme.headlineLarge,
                          ),
                          ButtonWidget(
                            onPressed: () {
                              ShowBottomFliterRoomScreen(context: context)
                                  .buidBottomFliterRoom();
                            },
                            alignmentGeometry: Alignment.centerRight,
                            icon: Icons.menu,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            Positioned(
              right: 16.0,
              bottom: 0,
              left: 16,
              child: SizedBox(
                height: AppBar().preferredSize.height,
                child: CustomTextFormField(
                  prefix: Icon(
                    TravoAppIcon.search,
                    color: ColorConstant.black54Color,
                  ),
                  //onFieldSubmitted:(value){} ,
                  onChanged: (value) {
                    context
                        .read<HotelBloc>()
                        .add(SearchHotelEvent(textSearchHotel: value));
                  },
                  hintText: context.l10n.searchHotel,
                  hintStyle: context.appTextTheme.bodyMedium
                      ?.copyWith(color: ColorConstant.grey400Color),
                ),
              ),
            ),
          ],
        ));
  }
}
