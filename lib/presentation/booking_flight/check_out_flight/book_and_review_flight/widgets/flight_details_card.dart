import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_export.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/custom_image_view.dart';
import '../../../../hotel/widgets/info_hotel_widget.dart';
import '../../../result_flight/widgets/dot_ticket_flight_widget.dart';
import '../../../select_seat/blocs/choose_location/choose_location_bloc.dart';
import '../../../select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';
import '../../../select_seat/blocs/seat/seat_bloc.dart';
import '../../blocs/add_passengers/add_passenger_bloc.dart';
import 'info_ticket_widget.dart';

//TODO: re-use widget chỗ này
class FlightDetailsCard extends StatelessWidget {
  const FlightDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;
    final location = context.watch<ChooseLocationBloc>().state;
    final flight = context.select((SeatBloc bloc) => bloc.state.flightEnity);
    final passengerName = context.watch<AddPassengerBloc>().state;
    final passengers =
        context.select((ChoosePassengersBloc bloc) => bloc.state.passengers);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      location.locationFromName[TextConstant.keyLocationFlight1]
                          .toString(),
                      style: theme.headlineMedium,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: 20.w,
                      height: 2.h,
                      color: ColorConstant.black87Color,
                    ),
                    CustomImageView(
                      imagePath: Assets.images.fly.path,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: 20.w,
                      height: 2.h,
                      color: ColorConstant.black87Color,
                    ),
                    Text(
                      location.locationToName[TextConstant.keyLocationFlight1]
                          .toString(),
                      style: theme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: const DashedWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomImageView(
                      imagePath: Assets.images.indo1.path,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.arriveText),
                        Text(
                          flight.airline.toString(),
                          style: theme.bodyLarge,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.passengersText),
                        Column(
                            children: List.generate(
                                passengerName.mapValueIndentity.length,
                                (index) {
                          return Text(
                            passengerName.mapValueName[
                                    passengerName.mapValueIndentity[index + 1]]
                                .toString(),
                            style: theme.bodyLarge,
                          );
                        })),
                      ],
                    ),
                  ],
                ),
              ),
              const InfoTicketFlightWidget(),
              const DashedWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: '\$${flight.price}', style: theme.headlineMedium),
                      TextSpan(
                          text: '/${l10n.passengersText}',
                          style: theme.bodySmall),
                    ])),
                    Text('$passengers passenger'),
                  ],
                ),
              ),
            ],
          ),
        ),
        DotTicketFlightWidget(
          top: 88.h,
          left: 0,
          color: ColorConstant.grey200Color,
        ),
        DotTicketFlightWidget(
          top: 88.h,
          right: 0,
          color: ColorConstant.grey200Color,
        ),
        DotTicketFlightWidget(
          bottom: 70.h,
          right: 0,
          color: ColorConstant.grey200Color,
        ),
        DotTicketFlightWidget(
          bottom: 70.h,
          left: 0,
          color: ColorConstant.grey200Color,
        ),
      ],
    );
  }
}
