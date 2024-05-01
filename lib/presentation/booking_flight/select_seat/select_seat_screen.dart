import 'package:flutter/material.dart';
import '../../../core/utils/my_globals.dart';
import 'widgets/app_bar_seat.dart';
import 'widgets/choose_seat_flight_widget.dart';
import 'widgets/process_btn_flight.dart';



class SelectSeatScreen extends StatelessWidget {
  const SelectSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MyGlobals().scaffoldKey,
        body: const CustomScrollView(
      slivers: [
        AppBarSeatWidget(),
        ChooseSeatFlightWidget(),
        ProcessBtnFlight(),
      ],
    ));
  }
}


