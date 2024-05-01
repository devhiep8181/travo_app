import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/name_route.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/custom_dialog.dart';
import '../../../../../widgets/custom_eleveted_button.dart';
import '../../../../booking/book_and_review/blocs/contact/contact_bloc.dart';
import '../../../../booking/book_and_review/blocs/promo/promo_bloc.dart';
import '../../../../payment/blocs/modify_or_choose_flight/modify_or_choose_flight_bloc.dart';
import '../../../../payment/pages/widgets_booking_flight/done_modify_flight_booking_btn.dart';
import '../../blocs/add_passengers/add_passenger_bloc.dart';

class BtnProcessCheckoutBookWidget extends StatelessWidget {
  const BtnProcessCheckoutBookWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contact = context.watch<ContactBloc>().state;
    final passengers = context.watch<AddPassengerBloc>().state;
    final promoCode = context.watch<PromoBloc>().state;
    final modifyBookingFlight = context.watch<ModifyOrChooseFlightBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: modifyBookingFlight.modifyBookingFlight
          ? const DoneModifyFligthBookingBtn()
          : CustomElevatedButton(
              onPressed: () {
                CustomDialog(context: context).showLoadingDialog();
                Timer(const Duration(milliseconds: 1500), () {
                  if (!contact.contactStatus.isSuccess) {
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
                    context.goNamed(paymentFlightRoute);
                  }
                });
              },
              textBtn: context.l10n.paymentBookingText,
            ),
    );
  }
}
