import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/date_time_format.dart';
import '../../../../../core/utils/text_constant.dart';
import '../../../select_seat/blocs/choose_date_flight/choose_date_flight_bloc.dart';
import '../../../select_seat/blocs/choose_seat/choose_seat_bloc.dart';
import '../../../select_seat/blocs/seat/seat_bloc.dart';
import '../../blocs/titlte_checkout_flight_data.dart';
import '../../widgets/ticket_flight_chekcout_widget.dart';

class InfoTicketFlightWidget extends StatelessWidget {
  const InfoTicketFlightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;
    final dateFlight = context.watch<ChooseDateFlightBloc>().state;
    final seat = context.watch<ChooseSeatBloc>().state;
    final flightInfo = context.watch<SeatBloc>().state;

    final subtitleTicket1 = [
      dateFlight.depatureDate[TextConstant.keyDepatureFlight1].toString(),
      '24A',
      flightInfo.flightEnity.no.toString()
    ];
    final boardingTime = DateTimeFormat.dateTimeFormatFlight(
        flightInfo.flightEnity.arriveTime ?? DateTime.now());

    return Column(children: [
      TicketFlightCheckoutWidget(
          tittle: titleCheckOutFlightData[0] ?? [], subtitle: subtitleTicket1),
      Row(
        children: List.generate(
          3,
          (index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titleCheckOutFlightData[1]![index]),
                    if (index == 0)
                      Text(
                        boardingTime,
                        style: theme.bodyLarge,
                      ),
                    if (index == 1)
                      Column(children: [
                        for (final seatEntity in seat.chooseSeat.entries)
                          Text(
                            seatEntity.value,
                            style: theme.bodyLarge,
                          )
                      ]),
                    if (index == 2)
                      Column(children: [
                        for (final classFlightEntity in seat.classSeat.entries)
                          Text(
                            classFlightEntity.value,
                            style: theme.bodyLarge,
                          )
                      ]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
