import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/cache/user_singleton.dart';
import '../../../../core/utils/name_route.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../book_and_review/blocs/choose_date/choose_date_bloc.dart';
import '../../book_and_review/blocs/contact_details/contact_details_bloc.dart';
import '../../book_and_review/blocs/room/room_choose_bloc.dart';
import '../../payment/bloc/bloc/card_bloc.dart';
import '../booking/booking_bloc.dart';

class ConfirmWidget extends StatelessWidget {
  const ConfirmWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Builder(
      builder: (context) {
        final stateCard = context.watch<CardBloc>().state;

        final stateRoomChoose = context.watch<RoomChooseBloc>().state;

        final stateContactDetail = context.watch<ContactDetailsBloc>().state;

        final stateDay = context.watch<ChooseDateBloc>().state;

        return Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: CustomElevatedButton(
            onPressed: () {
              final checkIn =
                  '${stateDay.dayStart} , ${stateDay.monthStart} ${stateDay.yearStart}';
              final checkOut =
                  '${stateDay.dayEnd} , ${stateDay.monthEnd} ${stateDay.yearEnd}';
              context.read<BookingBloc>().add(ProcessBookingEvent(
                    creatAt: DateTime.now().toIso8601String(),
                    checkIn: checkIn,
                    checkOut: checkOut,
                    emailUser: UserSingleton().email,
                    emailGuest: stateContactDetail.email,
                    nameGuest: stateContactDetail.name,
                    phoneGuest: stateContactDetail.phoneNumber,
                    idHotel: stateRoomChoose.roomEntity.hotelId,
                    nameRoom: stateRoomChoose.roomEntity.name,
                    numberCard: stateCard.cardNumber,
                    expDate: stateCard.expDate,
                    cvv: stateCard.cVV,
                    country: stateCard.countryName,
                    imageRoom: stateRoomChoose.roomEntity.image,
                    typePayment: stateCard.name,
                  ));

              CustomDialog(context: context).showLoadingDialog();
              Timer(const Duration(seconds: 2), () {
                context.goNamed(paymentRoute);
              });
            },
            textBtn: l10n.payNowBtnText,
          ),
        );
      },
    );
  }
}
