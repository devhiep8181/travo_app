import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../domain/entities/booking_entity.dart';
import '../../../gen/assets.gen.dart';
import '../../../widgets/custom_image_view.dart';
import '../../booking/book_and_review/booking_date_widget.dart';
import '../../hotel/widgets/info_hotel_widget.dart';
import '../blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import 'build_info_widget.dart';

class ItemRoomBooking extends StatelessWidget {
  const ItemRoomBooking({
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
            .add(GetRoomModifyEvent(bookingEntity: bookingEntity));
        context.goNamed(modifyBookingRoomRoute);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          children: [
            CustomImageView(
              fit: BoxFit.fitWidth,
              radius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r)),
              height: 110.h,
              width: double.infinity,
              imagePath: bookingEntity.imageRoom,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookingEntity.nameRoom.toString(),
                    style: context.appTextTheme.titleSmall?.copyWith(
                        fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const DashedWidget(),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTimeBookingDate(
                            imagePath: Assets.images.checkInGroup1,
                            title: TextConstant.checkInText,
                            subtitle: bookingEntity.checkIn.toString()),
                        CustomTimeBookingDate(
                            imagePath: Assets.images.checkInGroup2,
                            title: TextConstant.checkOutText,
                            subtitle: bookingEntity.checkOut.toString())
                      ]),
                  SizedBox(
                    height: 12.h,
                  ),
                  const DashedWidget(),
                  SizedBox(
                    height: 8.h,
                  ),
                  BuildInfoWidget(
                      icon: Icons.person,
                      label: 'Name:',
                      value: bookingEntity.nameGuest.toString()),
                  SizedBox(height: 8.h),
                  BuildInfoWidget(
                      icon: Icons.email,
                      label: 'Email:',
                      value: bookingEntity.emailGuest.toString()),
                  SizedBox(height: 8.h),
                  BuildInfoWidget(
                      icon: Icons.phone,
                      label: 'Phone:',
                      value: bookingEntity.phoneGuest.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
