import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_eleveted_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../blocs/flight/flight_bloc.dart';
import '../select_seat/blocs/choose_date_flight/choose_date_flight_bloc.dart';
import '../select_seat/blocs/choose_location/choose_location_bloc.dart';
import 'choose_class_flight_widget.dart';
import 'choose_date_flight_widget.dart';
import 'choose_location_widget.dart';
import 'choose_passengers_widget.dart';

class PageBookFlightWidget extends StatelessWidget {
  const PageBookFlightWidget({
    super.key,
    this.roundTrip = false,
    this.hideBtnSearch = false,
    this.twoWay = false,
  });

  final bool roundTrip;
  final bool hideBtnSearch;
  final bool twoWay;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: [
        Column(
          children: [
            ChooseLocationWidget(
              title: l10n.fromText,
              subtitle: l10n.selectedLocationText,
              imagePath: Assets.images.flightBack,
              twoWay: twoWay,
            ),
            ChooseLocationWidget(
              title: l10n.toText,
              subtitle: l10n.selectedLocationText,
              imagePath: Assets.images.location,
              toLocation: true,
              twoWay: twoWay,
            ),
            if (roundTrip)
              ChooseDateFlightWidget(
                  returnDate: true,
                  roundTrip: roundTrip,
                  twoWay: twoWay,
                  title: l10n.departureText,
                  subtitle: l10n.selectDateText,
                  imagePath: Assets.images.selectedDate)
            else
              ChooseDateFlightWidget(
                  returnDate: false,
                  twoWay: twoWay,
                  title: l10n.departureText,
                  subtitle: l10n.selectDateText,
                  imagePath: Assets.images.selectedDate),
            if (roundTrip)
              ChooseDateFlightWidget(
                hideReturnDate: false,
                returnDate: true,
                twoWay: twoWay,
                title: l10n.returnText,
                subtitle: l10n.selectDateText,
                imagePath: Assets.images.selectedDate,
                roundTrip: roundTrip,
              )
            else
              const SizedBox(),
            ChoosePassengersWidget(
                title: l10n.passengersText,
                subtitle: 'Add Passengers',
                imagePath: Assets.images.person),
            const ChooseClassFlightWidget(),
            SizedBox(
              height: 12.h,
            ),
            if (hideBtnSearch)
              const SizedBox()
            else
              BlocListener<FlightBloc, FlightState>(
                listener: (context, state) {
                  if (state.flightStatus.isLoaded) {
                    Timer(const Duration(microseconds: 1800), () {
                      context.goNamed(resultFlightRoute);
                    });
                  }
                },
                child: Builder(builder: (context) {
                  final dateState = context.watch<ChooseDateFlightBloc>().state;
                  final locationValue =
                      context.watch<ChooseLocationBloc>().state;

                  return CustomElevatedButton(
                    onPressed: () {
                      CustomDialog(context: context).showLoadingDialog();
                      Timer(const Duration(milliseconds: 1500), () {
                        if (!locationValue.locationStatus.isLoaded) {
                          CustomDialog(context: context)
                              .showCustomDialogNoAutoOff(
                                  notificationText: 'Select Location',
                                  dialogStatus: DialogStatus.error);
                        } else if (!dateState.chooseDateFlightStatus.isLoaded) {
                          CustomDialog(context: context)
                              .showCustomDialogNoAutoOff(
                                  notificationText: 'Select Date',
                                  dialogStatus: DialogStatus.error);
                        } else {
                          context.read<FlightBloc>().add(GetFlightEvent(
                              toFlight: locationValue.locationToName[
                                      TextConstant.keyLocationFlight1]
                                  .toString(),
                              fromFlight: locationValue.locationFromName[
                                      TextConstant.keyLocationFlight1]
                                  .toString()));
                        }
                      });
                    },
                    textBtn: l10n.searchBtnText,
                  );
                }),
              )
          ],
        ),
        Positioned(
          right: 12.w,
          top: 50.h,
          child: InkWell(
            onTap: () {
              final chooseLocationBloc = context.read<ChooseLocationBloc>()
                ..add(ConvertLocationEvent(twoWay: twoWay));

              chooseLocationBloc.stream.listen((event) {
                if (event.locationStatus.isError) {
                  CustomDialog(context: context).showCustomDialog(
                    notificationText: 'Selected Location',
                    dialogStatus: DialogStatus.error,
                  );
                }
              });
            },
            child: CustomImageView(imagePath: Assets.images.btnTwoway),
          ),
        )
      ],
    );
  }
}
