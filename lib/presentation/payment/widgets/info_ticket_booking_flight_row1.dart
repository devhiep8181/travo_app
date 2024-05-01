
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../domain/entities/booking_flight_entity.dart';
import '../../../l10n/l10n.dart';

class InfoTicketBookingFlightRow1 extends StatelessWidget {
  const InfoTicketBookingFlightRow1({
    required this.bookingFlightEntity,
    super.key,
  });

  final BookingFlightEntity bookingFlightEntity;

  @override
  Widget build(BuildContext context) {
    final titleTicket = <String>[
      context.l10n.passengersText,
      context.l10n.seatText,
      context.l10n.classText,
    ];

    final value = <int, List<String>>{
      0: bookingFlightEntity.nameGuest!,
      1: bookingFlightEntity.seats!,
      2: bookingFlightEntity.classSeats!,
    };  
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) {
          return Column(
            children: [
              Text(
                titleTicket[index],
                style: context.appTextTheme.bodyLarge,
              ),
              for (final entity in value[index]!) Text(entity),
            ],
          );
        })
        );
  }
}