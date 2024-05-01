import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../booking/widgets/contact_details_widget.dart';
import '../../../booking/widgets/subtitle_checkout_widget.dart';
import 'widgets/btn_process_chechout_book_widget.dart';
import 'widgets/flight_details_card.dart';
import 'widgets/item_passengers.dart';
import 'widgets/promo_flight_widget.dart';

class BookAndReviewFlightScreen extends StatelessWidget {
  const BookAndReviewFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n.checkoutTitle,
        subtitleWidget: const SubtitleCheckoutWidget(indexPage: 1),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, (context, index) {
            return Column(
              children: [
                const FlightDetailsCard(),
                ContactDetailsCard(
                  onTap: () {
                    context.goNamed(addContactFlightRoute);
                  },
                ),
                const ItemPassengers(),
                PromoFlightWidget(
                  onTap: () {
                    context.goNamed(addPromoFlightRoute);
                  },
                ),
                const BtnProcessCheckoutBookWidget()
              ],
            );
          }))
        ],
      ),
    );
  }
}

