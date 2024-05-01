import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../domain/entities/booking_entity.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../../booking/book_and_review/blocs/room/room_choose_bloc.dart';
import '../../blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../../widgets/info_tag_modify_widget.dart';

class NameRoomModifyWidget extends StatelessWidget {
  const NameRoomModifyWidget({
    required this.bookingEntity,
    super.key,
  });
  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<ModifyOrChooseRoomBloc>()
            .add(const ProcessModifyOrChooseRoomEvent(modifyBookingRoom: true));
        context.goNamed(hotleRoute);
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Builder(builder: (context) {
            final stateModifyRoom =
                context.watch<ModifyOrChooseRoomBloc>().state;
            final stateChooseRoom = context.watch<RoomChooseBloc>().state;

            final checkValue = stateChooseRoom.roomChooseStatus.isLoaded &&
                stateModifyRoom.modifyorChooseRoomStatus.isLoaded;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  fit: BoxFit.fitWidth,
                  radius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r)),
                  height: 110.h,
                  width: double.infinity,
                  imagePath: checkValue
                      ? stateChooseRoom.roomEntity.image
                      : bookingEntity.imageRoom,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  child: InfoTagModifyWidget(
                    title: checkValue
                        ? stateChooseRoom.roomEntity.name
                        : bookingEntity.nameRoom.toString(),
                    style: context.appTextTheme.titleSmall?.copyWith(
                        fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            );
          })),
    );
  }
}
