import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_dialog.dart';
import '../blocs/chooose_class_flight/choose_class_flight_bloc.dart';
import '../blocs/choose_seat/choose_seat_bloc.dart';
import '../blocs/seat/seat_bloc.dart';
import '../blocs/select_seat_data.dart';
import 'seat_widget.dart';

class SeatEcomicWidget extends StatelessWidget {
  const SeatEcomicWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final encomicValueSeat =
        context.select((SeatBloc bloc) => bloc.state.encomicSeat);
    final valueSeat = context.watch<ChooseSeatBloc>().state;
    final countEconomyClass =
        context.watch<ChooseClassFlightBloc>().state.countEconomyClass;

    void handleSelectedSeat(
        {required String keySeat,
        required String keySeatEvent,
        required String seat}) {
      if (encomicValueSeat[keySeat] == false) {
        if (valueSeat.countSeatsEnconomyChoose < countEconomyClass) {
          context.read<ChooseSeatBloc>().add(GetSeatEvent(
              keySeatEvent: keySeatEvent,
              seatCheck: false,
              seatLocation: seat,
              seatClass: l10n.economyClassText));
        } else if (valueSeat.countSeatsEnconomyChoose == countEconomyClass) {
          if (valueSeat.chooseSeat.containsKey(keySeatEvent)) {
            context.read<ChooseSeatBloc>().add(GetSeatEvent(
                keySeatEvent: keySeatEvent,
                seatCheck: false,
                seatLocation: seat,
                seatClass: l10n.economyClassText));
          } else {
            CustomDialog(context: context).showCustomDialogNoAutoOff(
              notificationText:
                  'You only order $countEconomyClass economy seats',
              dialogStatus: DialogStatus.error,
            );
          }
        }
      } else {
        CustomDialog(context: context).showCustomDialogNoAutoOff(
          notificationText: 'This seat has been reserved',
          dialogStatus: DialogStatus.error,
        );
      }
    }

    return Positioned(
        top: 350.h,
        //left: 8.w,
        child: Column(
          children: List.generate(5, (index) {
            final indexColumn = index + 1;
            return Row(
              children: List.generate(6, (index) {
                final keySeat = '$indexColumn$index';
                final keySeatEvent = '$keySeat${TextConstant.classEconomy}';
                final seat = '$indexColumn${economySeat[index]}';
                return Row(
                  children: [
                    SeatWidget(
                        padding: 4,
                        seat: seat,
                        seatClass: l10n.economyClassText,
                        boolValueSeat: encomicValueSeat[keySeat] ?? false,
                        nameSeat: economySeat[index] ?? '',
                        onTap: () {
                          handleSelectedSeat(
                              keySeat: keySeat,
                              keySeatEvent: keySeatEvent,
                              seat: seat);
                        }),
                    if (index == 2)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '$indexColumn',
                          style: context.appTextTheme.titleMedium,
                        ),
                      ),
                  ],
                );
              }),
            );
          }),
        ));
  }
}
