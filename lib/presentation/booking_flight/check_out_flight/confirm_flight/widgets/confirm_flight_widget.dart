import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_export.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/custom_dialog.dart';
import '../../../../../widgets/custom_eleveted_button.dart';
import '../../../../booking/book_and_review/blocs/contact/contact_bloc.dart';
import '../../../../booking/book_and_review/blocs/promo/promo_bloc.dart';
import '../../../../booking/payment/bloc/bloc/card_bloc.dart';
import '../../../../booking/payment/bloc/choose_card/bloc/choose_card_bloc.dart';
import '../../../../hotel/widgets/info_hotel_widget.dart';
import '../../../blocs/confirm_flight/confirm_flight_bloc.dart';
import '../../../select_seat/blocs/choose_date_flight/choose_date_flight_bloc.dart';
import '../../../select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';
import '../../../select_seat/blocs/choose_seat/choose_seat_bloc.dart';
import '../../../select_seat/blocs/seat/seat_bloc.dart';
import '../../blocs/add_passengers/add_passenger_bloc.dart';

class ConfirmFlightBtnWidget extends StatelessWidget {
  const ConfirmFlightBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final flight = context.watch<SeatBloc>().state;
    final chooseCardState = context.watch<ChooseCardBloc>().state;
    final passenger =
        context.select((ChoosePassengersBloc bloc) => bloc.state.passengers);
    final seats = context.watch<ChooseSeatBloc>().state;
    final stateCard = context.watch<CardBloc>().state;
    final dateFlight = context.watch<ChooseDateFlightBloc>().state;
    final promoValue =
        context.select((PromoBloc bloc) => bloc.state.choosePromo);
    final contactUser = context.watch<ContactBloc>().state;
    final insuranceValue =
        flight.flightEnity.price! * passenger * promoValue.price!;
    final totalPrice = (flight.flightEnity.price! * passenger) - insuranceValue;
    final nameGuest = context.watch<AddPassengerBloc>().state;

    return BlocListener<ConfirmFlightBloc, ConfirmFlightState>(
      listener: (context, state) {
        if (state.confirmFlightStatus.isSuccess) {
          Timer(const Duration(milliseconds: 1500), () {
            CustomDialog(context: context).showCustomDialog(
              notificationText: 'Booking Flight Success',
              dialogStatus: DialogStatus.success,
            );
          });
          Timer(const Duration(milliseconds: 3500), () {
            context.goNamed(paymentRoute);
          });
        } else if (state.confirmFlightStatus.isError) {
          CustomDialog(context: context).showCustomDialog(
            notificationText: 'Booking Flight Error',
            dialogStatus: DialogStatus.error,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomElevatedButton(
          onPressed: () {
            context.read<ConfirmFlightBloc>().add(ProcessConfirmFlightEvent(
                creatAt: DateTime.now().toIso8601String(),
                emailUser: contactUser.userEnity.email,
                passengers: passenger,
                totalPrice: totalPrice,
                promoCode: promoValue.code.toString(),
                nameAirline: flight.flightEnity.airline.toString(),
                seats: seats.chooseSeat,
                classSeats: seats.classSeat,
                mapValueNameGuest: nameGuest.mapValueName,
                mapValueIndentity: nameGuest.mapValueIndentity,
                date: dateFlight.depatureDate[TextConstant.keyDepatureFlight1]
                    .toString(),
                typePayment: chooseCardState.titlePayment,
                numberCard: stateCard.cardNumber,
                expDate: stateCard.expDate,
                cvv: stateCard.cVV,
                country: stateCard.countryName));

            CustomDialog(context: context).showLoadingDialog();
          },
          textBtn: context.l10n.payNowBtnText,
        ),
      ),
    );
  }
}

class PriceFlightWidget extends StatelessWidget {
  const PriceFlightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final flight = context.select((SeatBloc bloc) => bloc.state.flightEnity);

    final passengers =
        context.select((ChoosePassengersBloc bloc) => bloc.state.passengers);
    final promoValue =
        context.select((PromoBloc bloc) => bloc.state.choosePromo);
    final insuranceValue = passengers * flight.price! * promoValue.price!;
    final totalTicket = passengers * flight.price!;
    final resultTotal = totalTicket - insuranceValue;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$passengers Passenger',
                  style: context.appTextTheme.bodyMedium,
                ),
                Text('\$$totalTicket'),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Insurance',
                  style: context.appTextTheme.bodyMedium,
                ),
                Text(
                  '$insuranceValue',
                  style: context.appTextTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            const DashedWidget(),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: context.appTextTheme.bodyLarge,
                ),
                Text('\$$resultTotal', style: context.appTextTheme.bodyLarge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
