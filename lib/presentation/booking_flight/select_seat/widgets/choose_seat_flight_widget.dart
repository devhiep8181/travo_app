import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_export.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_image_view.dart';
import '../blocs/choose_seat/choose_seat_bloc.dart';
import '../blocs/seat/seat_bloc.dart';
import 'seat_business_widget.dart';
import 'seat_ecomic_widget.dart';

class ChooseSeatFlightWidget extends StatelessWidget {
  const ChooseSeatFlightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final seatState = context.watch<ChooseSeatBloc>().state;
    return SliverFillRemaining(
        child: Row(
      children: [
        Expanded(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            if (seatState.chooseSeatStatus.isLoaded)
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16)
                        .copyWith(left: 16.w),
                    width: 200.w,
                    decoration: BoxDecoration(
                        color: ColorConstant.whiteColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(children: [
                                Column(
                                  children: [
                                    for (final entry
                                        in seatState.chooseSeat.entries)
                                      Text(
                                        '${entry.value} - ',
                                        style: context.appTextTheme.titleLarge
                                            ?.copyWith(
                                                color:
                                                    ColorConstant.primaryColor),
                                      ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    for (final entry
                                        in seatState.classSeat.entries)
                                      Text(
                                        entry.value,
                                        style: context.appTextTheme.titleLarge
                                            ?.copyWith(
                                                color:
                                                    ColorConstant.primaryColor),
                                      )
                                  ],
                                )
                              ])
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  ColorConstant.grey400Color.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60.w, vertical: 14.h),
                              child: Builder(builder: (context) {
                                final priceSeat = context.select(
                                    (SeatBloc bloc) => bloc.state.price);
                                return Text(
                                  '\$$priceSeat',
                                  style: context.appTextTheme.titleMedium
                                      ?.copyWith(
                                          color: ColorConstant.primaryColor),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            else
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
              ),
            SizedBox(
              width: 500,
              child: Stack(
                children: [
                  CustomImageView(
                    width: 250.w,
                    imagePath: Assets.images.layoutFlight.path,
                  ),
                  Positioned(
                      top: 50.h,
                      left: 60.w,
                      child: CustomImageView(
                          imagePath: Assets.images.imageFlight1.path)),
                  Positioned(
                      top: 140.h,
                      left: 80.w,
                      child: Text(l10n.bussinessClassText)),

                  ///Encomic Class
                  Positioned(
                      top: 335.h,
                      left: 80.w,
                      child: Text(l10n.economyClassText)),

                  const SeatBusinessWidget(),
                  const SeatEcomicWidget(),
                ],
              ),
            )
          ],
        )),
      ],
    ));
  }
}
