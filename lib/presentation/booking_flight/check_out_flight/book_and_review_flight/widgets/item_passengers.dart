import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_export.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/custom_image_view.dart';
import '../../../../booking/widgets/custom_tag_checkout_widget.dart';
import '../../blocs/add_passengers/add_passenger_bloc.dart';

class ItemPassengers extends StatelessWidget {
  const ItemPassengers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<AddPassengerBloc, AddPassengerState>(
        builder: (context, state) {
          if (state.addPassengerStatus.isSucees) {
            return InkWell(
              onTap: () {
                context.goNamed(addPassengersRoute);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                height: 100.h,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: Assets.images.economi,
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                          Text(
                            context.l10n.passengersText,
                            style: context.appTextTheme.titleMedium,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: ListView.builder(
                              itemCount: state.mapValueIndentity.length,
                              itemBuilder: (context, index) {
                                final valueName = state.mapValueName[
                                    state.mapValueIndentity[index + 1]];
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: CircleAvatar(
                                        radius: 15.r,
                                        backgroundColor:
                                            ColorConstant.blueVioletColor,
                                        child: Icon(
                                          Icons.person,
                                          size: 20.sp,
                                          color: ColorConstant.whiteColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(
                                      valueName.toString(),
                                      style: context.appTextTheme.bodyMedium,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return CustomTagCheckoutWidget(
            imagePath: Assets.images.economi,
            textTitleTag: context.l10n.passengersText,
            textBtn: context.l10n.addPassengerText,
            onTap: () {
              context.goNamed(addPassengersRoute);
            },
          );
        },
      ),
    );
  }
}
