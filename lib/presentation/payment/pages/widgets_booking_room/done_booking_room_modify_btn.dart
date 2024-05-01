import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/date_time_format.dart';
import '../../../../core/utils/name_route.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../../booking/book_and_review/blocs/choose_date/choose_date_bloc.dart';
import '../../../booking/book_and_review/blocs/contact_details/contact_details_bloc.dart';
import '../../../booking/book_and_review/blocs/room/room_choose_bloc.dart';
import '../../../booking/confirm/booking/booking_bloc.dart';
import '../../blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';

class DoneBookingRoomModifyBtn extends StatelessWidget {
  const DoneBookingRoomModifyBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final stateRoomChoose = context.watch<RoomChooseBloc>().state;

      final stateContactDetail = context.watch<ContactDetailsBloc>().state;

      final stateDay = context.watch<ChooseDateBloc>().state;

      final stateModifyBookingRoom =
          context.watch<ModifyOrChooseRoomBloc>().state;

      final bookingState = context.watch<BookingBloc>().state;

      final checkIn = DateTimeFormat.dateTimeFormatRoom(
          stateDay.dayStart, stateDay.monthStart, stateDay.yearStart);
      final checkOut = DateTimeFormat.dateTimeFormatRoom(
          stateDay.dayEnd, stateDay.monthEnd, stateDay.yearEnd);

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomElevatedButton(
          onPressed: () {
            context.read<BookingBloc>().add(EditBookingRoomEvent(
                creatAt: DateTime.now().toIso8601String(),
                checkIn: checkIn,
                checkOut: checkOut,
                emailGuest: stateContactDetail.email,
                nameGuest: stateContactDetail.name,
                phoneGuest: stateContactDetail.phoneNumber,
                idHotel: stateRoomChoose.roomEntity.hotelId,
                nameRoom: stateRoomChoose.roomEntity.name,
                imageRoom: stateRoomChoose.roomEntity.image,
                uid: stateModifyBookingRoom.bookingEntity.uidRoomBooking));

            CustomDialog(context: context).showLoadingDialog();
            Timer(const Duration(milliseconds: 1500), () {
              if (bookingState.bookingStatus.isSuccess) {
                context.goNamed(paymentRoute);
              } else {
                CustomDialog(context: context).showCustomDialogNoAutoOff(
                    notificationText: 'Success',
                    dialogStatus: DialogStatus.success);
              }
              // context.goNamed(paymentRoute);
            });
          },
          textBtn: context.l10n.doneBtnText,
        ),
      );
    });
  }
}
