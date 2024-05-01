import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/name_route.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../blocs/choose_passengers/choose_passengers_bloc.dart';
import '../blocs/choose_seat/choose_seat_bloc.dart';

class ProcessBtnFlight extends StatelessWidget {
  const ProcessBtnFlight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final seatState = context.watch<ChooseSeatBloc>().state;
    final passengers =
        context.select((ChoosePassengersBloc bloc) => bloc.state.passengers);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomElevatedButton(
          onPressed: () {
            if (passengers == seatState.chooseSeat.length) {
              CustomDialog(context: context).showLoadingDialog();
              Timer(const Duration(milliseconds: 1500), () {
                context.goNamed(bookAndReviewFlightRoute);
              });
            } else {
              CustomDialog(context: context).showCustomDialog(
                notificationText: 'No Seat',
                dialogStatus: DialogStatus.error,
              );
            }
          },
          textBtn: l10n.processeText,
        ),
      ),
    );
  }
}
