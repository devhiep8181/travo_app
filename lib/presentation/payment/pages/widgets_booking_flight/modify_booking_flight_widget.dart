import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/name_route.dart';
import '../../blocs/modify_or_choose_flight/modify_or_choose_flight_bloc.dart';
import '../../widgets/info_booking_flight_widget.dart';

class ModifyBookingFlightWidget extends StatelessWidget {
  const ModifyBookingFlightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(builder: (context) {
          final bookingFlightEntity =
              context.watch<ModifyOrChooseFlightBloc>().state;
          return InfoBookingFlightWidget(
            bookingFlightEntity: bookingFlightEntity.bookingFlightEntity,
            onTap: () {
              context
                  .read<ModifyOrChooseFlightBloc>()
                  .add(const ProcessFlightBooking(modifyFlightBooking: true));
              context.goNamed(bookingFlightRoute);
            },
          );
        }),
      ],
    );
  }
}
