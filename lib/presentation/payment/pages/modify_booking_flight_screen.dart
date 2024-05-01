import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_eleveted_button.dart';

import '../widgets/app_bar_modify_booking_widget.dart';

import 'widgets_booking_flight/modify_booking_flight_widget.dart';

class ModifyBookingFlightScreen extends StatelessWidget {
  const ModifyBookingFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppbarModifyBookingWidget(
            title: 'Flight Booking',
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const ModifyBookingFlightWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomElevatedButton(
                onPressed: () {
                  context.goNamed(paymentRoute);
                },
                textBtn: context.l10n.doneBtnText,
              ),
            )
          ])),
        ],
      ),
    );
  }
}
