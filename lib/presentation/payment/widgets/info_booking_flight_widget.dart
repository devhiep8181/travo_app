import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../domain/entities/booking_flight_entity.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_image_view.dart';
import '../../booking/book_and_review/blocs/promo/promo_bloc.dart';
import '../../booking_flight/select_seat/blocs/choose_date_flight/choose_date_flight_bloc.dart';
import '../../booking_flight/select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';
import '../../booking_flight/select_seat/blocs/seat/seat_bloc.dart';
import '../blocs/modify_or_choose_flight/modify_or_choose_flight_bloc.dart';
import 'info_ticket_booking_flight_row1.dart';

class InfoBookingFlightWidget extends StatelessWidget {
  const InfoBookingFlightWidget({
    required this.bookingFlightEntity,
    this.onTap,
    super.key,
  });

  final BookingFlightEntity bookingFlightEntity;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            context.read<ModifyOrChooseFlightBloc>().add(GetFlightBookingEvent(
                  bookingFlightEntity: bookingFlightEntity,
                  modifyFlightBooking: true,
                ));

            context.goNamed(bookingFlightRoute);
          },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            NameAirlineWidget(bookingFlightEntity: bookingFlightEntity),
            ContentBookingFlight(bookingFlightEntity: bookingFlightEntity)
          ],
        ),
      ),
    );
  }
}

class ContentBookingFlight extends StatelessWidget {
  const ContentBookingFlight({
    required this.bookingFlightEntity,
    super.key,
  });

  final BookingFlightEntity bookingFlightEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InfoTicketBookingFlightRow1(
                    bookingFlightEntity: bookingFlightEntity),
                SizedBox(
                  height: 20.h,
                ),
                Builder(builder: (context) {
                  final modifyBookingFlight =
                      context.watch<ModifyOrChooseFlightBloc>().state;
                  final flight =
                      context.select((SeatBloc bloc) => bloc.state.flightEnity);

                  final passengers = context.select(
                      (ChoosePassengersBloc bloc) => bloc.state.passengers);
                  final promoValue = context.read<PromoBloc>().state;
                  final insuranceValue = passengers *
                      flight.price! *
                      promoValue.choosePromo.price!;
                  final totalTicket = passengers * flight.price!;
                  final resultTotal = totalTicket - insuranceValue;

                  final checkValue =
                      modifyBookingFlight.modifyOrChooseFlightStatus.isLoaded &&
                          promoValue.promoStatus.isLoaded;
                  final dateFlight =
                      context.watch<ChooseDateFlightBloc>().state;
                  final date =
                      dateFlight.depatureDate[TextConstant.keyDepatureFlight1];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.dateText,
                              style: context.appTextTheme.bodyLarge,
                            ),
                            Text(checkValue
                                ? date ?? ''
                                : bookingFlightEntity.date ?? ''),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.totalText,
                              style: context.appTextTheme.bodyLarge,
                            ),
                            Text(
                              checkValue
                                  ? '\$$resultTotal'
                                  : '\$${bookingFlightEntity.totalPrice}',
                              style: context.appTextTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CustomImageView(
            width: 30.w,
            height: 100.h,
            imagePath: Assets.images.coder.path,
          ),
        )
      ],
    );
  }
}

class NameAirlineWidget extends StatelessWidget {
  const NameAirlineWidget({
    required this.bookingFlightEntity,
    super.key,
  });

  final BookingFlightEntity bookingFlightEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: ColorConstant.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: Builder(builder: (context) {
        final airline = context.watch<SeatBloc>().state;

        final modifyBookingFlight =
            context.watch<ModifyOrChooseFlightBloc>().state;

        final checkValue = airline.seatStatus.isLoaded &&
            modifyBookingFlight.modifyOrChooseFlightStatus.isLoaded;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              checkValue
                  ? airline.flightEnity.airline.toString()
                  : bookingFlightEntity.nameAirline ?? '',
              style: context.appTextTheme.titleLarge
                  ?.copyWith(color: ColorConstant.whiteColor),
            ),
            SizedBox(
              width: 30.w,
            ),
            Icon(
              Icons.flight_takeoff,
              color: ColorConstant.whiteColor,
              size: 40.sp,
            ),
          ],
        );
      }),
    );
  }
}
