import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/date_time_format.dart';
import '../../../../core/utils/name_route.dart';
import '../../../../core/utils/text_constant.dart';
import '../../../../domain/entities/booking_entity.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../booking/book_and_review/blocs/choose_date/choose_date_bloc.dart';
import '../../../booking/book_and_review/booking_date_widget.dart';
import '../../blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../../widgets/info_tag_modify_widget.dart';

class BookingDateModifyWidget extends StatelessWidget {
  const BookingDateModifyWidget({required this.bookingEntity, super.key});

  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<ModifyOrChooseRoomBloc>()
            .add(const ProcessModifyOrChooseRoomEvent(modifyBookingRoom: true));
        context.goNamed(bookingDateModifyRoute);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InfoTagModifyWidget(
                title: context.l10n.bookingDateText,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(builder: (context) {
                    final stateModify =
                        context.watch<ModifyOrChooseRoomBloc>().state;
                    final stateChooseDateRoom =
                        context.watch<ChooseDateBloc>().state;
                    final dateStart = DateTimeFormat.dateTimeFormatRoom(stateChooseDateRoom.dayStart, stateChooseDateRoom.monthStart, stateChooseDateRoom.yearStart);
                    final dateEnd = DateTimeFormat.dateTimeFormatRoom(stateChooseDateRoom.dayEnd, stateChooseDateRoom.monthEnd, stateChooseDateRoom.yearEnd);
                    final checkValue =
                        stateModify.modifyorChooseRoomStatus.isLoaded &&
                            stateChooseDateRoom.chooseDateStatus.isLoaded;
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTimeBookingDate(
                              imagePath: Assets.images.checkInGroup1,
                              title: TextConstant.checkInText,
                              subtitle: checkValue ? dateStart: bookingEntity.checkIn.toString()),
                          CustomTimeBookingDate(
                              imagePath: Assets.images.checkInGroup2,
                              title: TextConstant.checkOutText,
                              subtitle: checkValue ? dateEnd : bookingEntity.checkOut.toString())
                        ]);
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
