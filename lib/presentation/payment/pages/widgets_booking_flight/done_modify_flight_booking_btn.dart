import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/cache/user_singleton.dart';
import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../../booking/book_and_review/blocs/contact/contact_bloc.dart';
import '../../../booking/book_and_review/blocs/promo/promo_bloc.dart';
import '../../../booking_flight/blocs/confirm_flight/confirm_flight_bloc.dart';
import '../../../booking_flight/check_out_flight/blocs/add_passengers/add_passenger_bloc.dart';
import '../../../booking_flight/select_seat/blocs/choose_date_flight/choose_date_flight_bloc.dart';
import '../../../booking_flight/select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';
import '../../../booking_flight/select_seat/blocs/choose_seat/choose_seat_bloc.dart';
import '../../../booking_flight/select_seat/blocs/seat/seat_bloc.dart';
import '../../blocs/modify_or_choose_flight/modify_or_choose_flight_bloc.dart';

class DoneModifyFligthBookingBtn extends StatelessWidget {
  const DoneModifyFligthBookingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final flight = context.watch<SeatBloc>().state;
    final passenger =
        context.select((ChoosePassengersBloc bloc) => bloc.state.passengers);
    final passengers = context.watch<AddPassengerBloc>().state;
    final seats = context.watch<ChooseSeatBloc>().state;
    final dateFlight = context.watch<ChooseDateFlightBloc>().state;
    final promoValue =
        context.select((PromoBloc bloc) => bloc.state.choosePromo);
    final promoCode = context.watch<PromoBloc>().state;
    final contactUser = context.watch<ContactBloc>().state;
    final insuranceValue =
        flight.flightEnity.price! * passenger * promoValue.price!;
    final totalPrice = (flight.flightEnity.price! * passenger) - insuranceValue;
    final nameGuest = context.watch<AddPassengerBloc>().state;
    final modifyBookingFlight = context.watch<ModifyOrChooseFlightBloc>().state;


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
        onPressed: () {
          context.read<ConfirmFlightBloc>().add(UpdateBookingFlightEvent(
              creatAt: DateTime.now().toIso8601String(),
              emailUser: UserSingleton().email,
              passengers: passenger,
              totalPrice: totalPrice,
              promoCode: promoValue.code.toString(),
              nameAirline: flight.flightEnity.airline.toString(),
              date: dateFlight.depatureDate[TextConstant.keyDepatureFlight1] ??
                  '',
              uid: modifyBookingFlight.bookingFlightEntity.uidBookingFlight ??
                  '',
              seats: seats.chooseSeat,
              classSeats: seats.classSeat,
              mapValueNameGuest: nameGuest.mapValueName,
              mapValueIndentity: nameGuest.mapValueIndentity));
          

          CustomDialog(context: context).showLoadingDialog();
          Timer(const Duration(milliseconds: 1500), () {
            if (!contactUser.contactStatus.isSuccess) {
              CustomDialog(context: context).showCustomDialogNoAutoOff(
                notificationText: 'Contact information is empty',
                dialogStatus: DialogStatus.error,
              );
            } else if (passengers.mapValueName.isEmpty) {
              CustomDialog(context: context).showCustomDialogNoAutoOff(
                notificationText: 'Passenger information is empty',
                dialogStatus: DialogStatus.error,
              );
            } else if (!promoCode.promoStatus.isSuccess) {
              CustomDialog(context: context).showCustomDialogNoAutoOff(
                notificationText: 'Promo Code is empty',
                dialogStatus: DialogStatus.error,
              );
            } else {
              context.goNamed(paymentRoute);
            }
          });
        },
        textBtn: context.l10n.doneBtnText,
      ),
    );
  }
}
