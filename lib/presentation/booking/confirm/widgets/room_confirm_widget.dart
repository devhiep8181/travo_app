import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../domain/entities/room_entity.dart';
import '../../../../gen/assets.gen.dart';

import '../../../../l10n/l10n.dart';
import '../../../../widgets/export_widgets.dart';
import '../../../hotel/widgets/info_hotel_widget.dart';
import '../../book_and_review/blocs/choose_date/choose_date_bloc.dart';
import '../../book_and_review/blocs/choose_guest/choose_guest_bloc.dart';
import '../../book_and_review/blocs/choose_room/choose_room_bloc.dart';
import '../../book_and_review/booking_date_widget.dart';

import '../../payment/bloc/choose_card/bloc/choose_card_bloc.dart';
import '../../widgets/custom_tag_checkout_widget.dart';
import 'confirm_widget.dart';

class RoomConfirmWidget extends StatelessWidget {
  const RoomConfirmWidget({
    required this.room,
    super.key,
  });

  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    final valueRoom =
        context.select((ChooseRoomBloc bloc) => bloc.state.valueRoom);
    final chooseCardState = context.watch<ChooseCardBloc>().state;

    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Column(children: [
      InfoRoomCofirmWidget(room: room),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1 Night', style: theme.bodyMedium),
                      Text('\$${room.price}', style: theme.bodyLarge)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n.taxesAndFees, style: theme.bodyMedium),
                    Text('Free', style: theme.bodyLarge)
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Room', style: theme.bodyMedium),
                    Text(valueRoom, style: theme.bodyLarge)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: DashedWidget(
                    color: ColorConstant.greyColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.totalText,
                      style: theme.bodyLarge,
                    ),
                    Text('\$${(room.price) * int.parse(valueRoom)}',
                        style: theme.bodyLarge)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      CustomTagCheckoutWidget(
        padding: EdgeInsets.zero,
        textTitleTag: chooseCardState.titlePayment,
        imagePath: chooseCardState.imagePath,
        onTap: () {
          context.pop();
        },
        hiddenBtn: true,
        //hiddenDotTopRight: false,
      ),
      const ConfirmWidget(),
    ]);
  }
}

class InfoRoomCofirmWidget extends StatelessWidget {
  const InfoRoomCofirmWidget({
    required this.room,
    super.key,
  });

  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    final valueGuest =
        context.select((ChooseGuestBloc bloc) => bloc.state.valueGuest);
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(room.name, style: theme.headlineSmall),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      TextConstant.freeCancellationText,
                      style: theme.bodyLarge,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomImageView(
                  radius: BorderRadius.circular(25.r),
                  height: 60.h,
                  width: 60.w,
                  imagePath: room.image,
                )
              ],
            ),
            Row(
              children: [
                CustomImageView(
                  margin: EdgeInsets.only(right: 16.w),
                  height: 37.h,
                  width: 37.w,
                  imagePath: Assets.images.guest,
                ),
                Expanded(
                    child: Text('$valueGuest Guest', style: theme.bodyLarge)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: DashedWidget(
                color: ColorConstant.greyColor,
              ),
            ),
            BlocBuilder<ChooseDateBloc, ChooseDateState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTimeBookingDate(
                        imagePath: Assets.images.checkInGroup1,
                        title: l10n.checkInText,
                        subtitle:
                            '${state.dayStart}, ${state.monthStart} ${state.yearStart}'),
                    CustomTimeBookingDate(
                        imagePath: Assets.images.checkInGroup2,
                        title: l10n.checkOutText,
                        subtitle:
                            '${state.dayEnd}, ${state.monthEnd} ${state.yearEnd}'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
