import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';

import '../../../../domain/entities/room_entity.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../../booking/book_and_review/blocs/room/room_choose_bloc.dart';
import '../../../payment/blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../../widgets/info_hotel_widget.dart';
import '../data/select_room_data.dart';

class InfoRoomWidget extends StatelessWidget {
  const InfoRoomWidget({
    required this.room,
    this.hiddenText = true,
    super.key,
  });

  final RoomEntity room;
  final bool hiddenText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final modifyRoomBooking = context
        .select((ModifyOrChooseRoomBloc bloc) => bloc.state.modifyBookingRoom);
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w, top: 20),
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.name,
                        style: theme.headlineSmall,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text('Max Guest : ${room.maxGuest}'),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text('Total: ${room.total}'),
                      SizedBox(
                        height: 6.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomImageView(
                    radius: BorderRadius.circular(20.r),
                    height: 60.h,
                    width: 60.w,
                    imagePath: room.image,
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(room.services.length, (index) {
                    final key = room.services[index] as String;
                    final value = selectRoomData[key];
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: value?[TextConstant.keyColor] as Color?,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomImageView(
                              imagePath:
                                  value?[TextConstant.keyImage] as String,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h, bottom: 2.h),
                          child: Text(
                            value?[TextConstant.keyTitle].toString() ?? '',
                            style: theme.titleSmall,
                            softWrap: true,
                          ),
                        ),
                        Text(
                          value?[TextConstant.keySubtitle].toString() ?? '',
                          style: theme.titleSmall,
                          softWrap: true,
                        ),
                      ],
                    );
                  })),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: DashedWidget(
                  color: ColorConstant.greyColor,
                ),
              ),
              BottomCardHotelWidget(
                price: room.price.toString(),
                hiddenText: hiddenText,
                buttonText: l10n.chooseText,
                onPressed: () {
                  context
                      .read<RoomChooseBloc>()
                      .add(GetRoomChooseEvent(roomEntity: room));
                  if (modifyRoomBooking) {
                    context.goNamed(modifyBookingRoomRoute);
                  } else {
                    context.goNamed(bookAndReviewRoute);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
