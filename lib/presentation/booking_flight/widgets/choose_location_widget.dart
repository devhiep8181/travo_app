import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../select_seat/blocs/choose_location/choose_location_bloc.dart';

class ChooseLocationWidget extends StatelessWidget {
  const ChooseLocationWidget({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.toLocation = false,
    this.twoWay = false,
    super.key,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final bool toLocation;
  final bool twoWay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final locationState = context.watch<ChooseLocationBloc>().state;

    return InkWell(
      onTap: () {
        showCountryPicker(
            countryListTheme: CountryListThemeData(bottomSheetHeight: 400.h),
            context: context,
            favorite: <String>['US', 'AU'],
            onSelect: (country) {
              toLocation
                  ? context.read<ChooseLocationBloc>().add(
                      GetChooseToLocationEvent(
                          twoWay: twoWay,
                          loactionToName: country.name == 'United States'
                              ? 'USA'
                              : country.name,
                          locationFromName: subtitle))
                  : context.read<ChooseLocationBloc>().add(
                      GetChooseFromLoactionEvent(
                          twoWay: twoWay,
                          locationFromName: country.name == 'United States'
                              ? 'USA'
                              : country.name,
                          locationToName: subtitle));
            });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                margin: EdgeInsets.only(right: 16.w),
                imagePath: imagePath,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    locationState.locationStatus.isLoaded
                        ? twoWay
                            ? toLocation
                                ? locationState.locationToName[
                                        TextConstant.keyLocationFlight2] ??
                                    subtitle
                                : locationState.locationFromName[
                                        TextConstant.keyLocationFlight2] ??
                                    subtitle
                            : toLocation
                                ? locationState.locationToName[
                                        TextConstant.keyLocationFlight1] ??
                                    subtitle
                                : locationState.locationFromName[
                                        TextConstant.keyLocationFlight1] ??
                                    subtitle
                        : subtitle,
                    style: theme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
