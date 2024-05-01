import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../booking/payment/bloc/choose_card/bloc/choose_card_bloc.dart';
import '../../../booking/widgets/custom_tag_checkout_widget.dart';
import '../../../booking/widgets/subtitle_checkout_widget.dart';
import '../book_and_review_flight/widgets/flight_details_card.dart';
import 'widgets/confirm_flight_widget.dart';

class ConfirmFlightScreen extends StatelessWidget {
  const ConfirmFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chooseCardState = context.watch<ChooseCardBloc>().state;

    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n.checkoutTitle,
        subtitleWidget: const SubtitleCheckoutWidget(indexPage: 3),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, (context, index) {
            return Column(
              children: [
                const FlightDetailsCard(),
                const PriceFlightWidget(),
                CustomTagCheckoutWidget(
                  textTitleTag: chooseCardState.titlePayment,
                  imagePath: chooseCardState.imagePath,
                  onTap: () {
                    context.pop();
                  },
                  hiddenBtn: true,
                ),
                const ConfirmFlightBtnWidget(),
              ],
            );
          }))
        ],
      ),
    );
  }
}
