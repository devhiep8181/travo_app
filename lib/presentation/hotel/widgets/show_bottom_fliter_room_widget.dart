import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../blocs/hotel/hotel_bloc.dart';

final titleSort = <String>['High To Low', 'Low To High'];

class ShowBottomFliterRoomScreen {
  ShowBottomFliterRoomScreen({
    required this.context,
  });
  final BuildContext context;

  void buidBottomFliterRoom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          final currentRangeValues =
              ValueNotifier<RangeValues>(const RangeValues(200, 700));
          return Container(
            height: 200.h,
            color: ColorConstant.grey200Color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Sort Price From',
                    style: context.appTextTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        2,
                        (index) => InkWell(
                              onTap: () {
                                if (index == 0) {
                                  context.read<HotelBloc>().add(
                                      const FilterHotelWithPrice(
                                          typeFilter:
                                              TypeFilter.sortPriceHighToLow));
                                  context.pop();
                                } else {
                                  context.read<HotelBloc>().add(
                                      const FilterHotelWithPrice(
                                          typeFilter:
                                              TypeFilter.sortPriceLowToHigh));
                                  context.pop();
                                }
                              },
                              child: Container(
                                height: 40.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Center(
                                  child: Text(
                                    titleSort[index],
                                    style: context.appTextTheme.bodyLarge
                                        ?.copyWith(
                                            color: ColorConstant.whiteColor),
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Budget',
                    style: context.appTextTheme.bodyLarge,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: currentRangeValues,
                  builder: (_, __, ___) => RangeSlider(
                    values: currentRangeValues.value,
                    max: 1000,
                    divisions: 10,
                    labels: RangeLabels(
                      currentRangeValues.value.start.round().toString(),
                      currentRangeValues.value.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      currentRangeValues.value = values;
                      context.read<HotelBloc>().add(FilterHotelWithPrice(
                          typeFilter: TypeFilter.choosePrice,
                          priceStart: currentRangeValues.value.start.toInt(),
                          priceEnd: currentRangeValues.value.end.toInt()));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
