import 'package:flutter/material.dart';
import 'widgets/app_bar_result_flight_widget.dart';
import 'widgets/ticket_flight_widget.dart';

class ResultFlightScreen extends StatelessWidget {
  const ResultFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarResutFlightWidget(),
          SliverFillRemaining(
            child: TicketFlightWidget(),
          ),
        ],
      ),
    );
  }
}





