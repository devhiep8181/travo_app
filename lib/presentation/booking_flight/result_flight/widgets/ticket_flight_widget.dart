import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/app_export.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../blocs/flight/flight_bloc.dart';
import '../../blocs/flight/flight_data.dart';
import '../../select_seat/blocs/seat/seat_bloc.dart';
import 'dot_ticket_flight_widget.dart';

class TicketFlightWidget extends StatelessWidget {
  const TicketFlightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBloc, FlightState>(
      builder: (context, state) {
        if (state.flightStatus.isLoaded) {
          final listFlight = state.lisFightEntity;
          return ListView.builder(
            itemCount: listFlight.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.read<SeatBloc>().add(
                      ProcessSeatEvent(
                          flightEnity: listFlight[index],
                          listBusinessSeat: listFlight[index].seat?[0]
                              as Map<String, dynamic>,
                          listEncomicSeat: listFlight[index].seat?[1]
                              as Map<String, dynamic>,
                          price: listFlight[index].price.toString()),
                    );

                context.goNamed(selectSeatRoute);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 50.h, horizontal: 24.w),
                              child: CustomImageView(
                                  imagePath:
                                      imageFlight[listFlight[index].airline]),
                            ),
                            _buildDashed(),
                            SizedBox(
                              width: 24.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(context.l10n.departureText),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              '${listFlight[index].departureTime?.hour} : ${listFlight[index].departureTime?.minute}',
                                              style: context
                                                  .appTextTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(context.l10n.arriveText),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              '${listFlight[index].arriveTime?.hour} : ${listFlight[index].arriveTime?.minute}',
                                              style: context
                                                  .appTextTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Flight No.',
                                              style: context
                                                  .appTextTheme.bodyMedium,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              listFlight[index].no ?? '',
                                              style: context
                                                  .appTextTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '\$${listFlight[index].price}',
                                          style: context
                                              .appTextTheme.headlineLarge
                                              ?.copyWith(
                                                  color:
                                                      ColorConstant.blackColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    DotTicketFlightWidget(
                      top: -10,
                      left: 110.w,
                    ),
                    DotTicketFlightWidget(
                      bottom: -10,
                      left: 110.w,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: Lottie.asset(Assets.animation.notFound),
        );
      },
    );
  }

  Column _buildDashed() {
    return Column(
      children: List.generate(
          8,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  width: 1.w,
                  height: 5.h,
                  decoration: BoxDecoration(color: ColorConstant.grey500Color),
                ),
              )),
    );
  }
}
