import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/app_export.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_eleveted_button.dart';
import '../../booking_flight/check_out_flight/book_and_review_flight/widgets/promo_flight_widget.dart';
import '../../hotel/select_room/widgets/info_room_widget.dart';
import '../widgets/contact_details_widget.dart';
import '../widgets/subtitle_checkout_widget.dart';
import 'blocs/choose_date/choose_date_bloc.dart';
import 'blocs/contact_details/contact_details_bloc.dart';
import 'blocs/room/room_choose_bloc.dart';
import 'booking_date_widget.dart';

class BookAndReviewScreen extends StatelessWidget {
  const BookAndReviewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contactState = context.watch<ContactDetailsBloc>().state;
    final dateState = context.watch<ChooseDateBloc>().state;
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {
          context.goNamed(selectRoomRoute);
        },
        title: l10n.checkoutTitle,
        subtitleWidget: const SubtitleCheckoutWidget(indexPage: 1),
      ),
      body: RefreshIndicator(
        color: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.blueAccentColor,
        strokeWidth: 4.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BlocBuilder<RoomChooseBloc, RoomChooseState>(
                builder: (context, state) {
                  if (state.roomChooseStatus.isLoaded) {
                    return InfoRoomWidget(
                      room: state.roomEntity,
                      hiddenText: false,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const ContactDetailsWidget(),
            SliverToBoxAdapter(
              child: PromoFlightWidget(
                onTap: () {
                  context.goNamed(promoCodeRoute);
                },
              ),
            ),
            const BookingDateWidget(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomElevatedButton(
                  onPressed: () {
                    CustomDialog(context: context).showLoadingDialog();
                    Timer(const Duration(seconds: 2), () {
                      if (contactState.email.isEmpty) {
                        CustomDialog(context: context)
                            .showCustomDialogNoAutoOff(
                                notificationText: 'Fill in contact information',
                                dialogStatus: DialogStatus.error);
                      } else if (dateState.dayStart.isEmpty) {
                        CustomDialog(context: context)
                            .showCustomDialogNoAutoOff(
                                notificationText: 'Please select a date',
                                dialogStatus: DialogStatus.error);
                      } else {
                        context.goNamed(paymentBookingRoute);
                      }
                    });
                  },
                  textBtn: l10n.paymentBookingText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
