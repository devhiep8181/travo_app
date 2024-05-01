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

class SeatBusinessWidget extends StatelessWidget {
  const SeatBusinessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final businessValueSeat =
        context.select((SeatBloc bloc) => bloc.state.busineessSeat);
    final valueSeat = context.watch<ChooseSeatBloc>().state;
    final countBusinessClass =
        context.watch<ChooseClassFlightBloc>().state.countBusinessClass;

    final l10n = context.l10n;
    void handleSelectedSeat(
        {required String keySeat,
        required String keySeatEvent,
        required String seat}) {
      if (businessValueSeat[keySeat] == false) {
        if (valueSeat.countSeatsBussineesChoose < countBusinessClass) {
          context.read<ChooseSeatBloc>().add(GetSeatEvent(
              keySeatEvent: keySeatEvent,
              seatCheck: false,
              seatLocation: seat,
              seatClass: l10n.bussinessClassText));
        } else {
          if (valueSeat.chooseSeat.containsKey(keySeatEvent)) {
            context.read<ChooseSeatBloc>().add(GetSeatEvent(
                keySeatEvent: keySeatEvent,
                seatCheck: false,
                seatLocation: seat,
                seatClass: l10n.bussinessClassText));
          } else {
            CustomDialog(context: context).showCustomDialogNoAutoOff(
              notificationText:
                  'You only order $countBusinessClass business seats',
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
        left: 20.w,
        top: 180.h,
        child: Column(
          children: List.generate(3, (index) {
            final indexColumn = index + 1;
            return Row(
              children: List.generate(4, (index) {
                final keySeat = '$indexColumn$index';
                final keySeatEvent = '$keySeat${TextConstant.classBusiness}';
                final seat = '$indexColumn${businessSeat[index]}'; //1A, 2A,...
                return Row(
                  children: [
                    SeatWidget(
                        seat: seat,
                        seatClass: l10n.bussinessClassText,
                        boolValueSeat: businessValueSeat[keySeat] ?? false,
                        nameSeat: businessSeat[index] ?? '',
                        onTap: () {
                          handleSelectedSeat(
                              keySeat: keySeat,
                              keySeatEvent: keySeatEvent,
                              seat: seat);
                        }),
                    if (index == 1)
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
