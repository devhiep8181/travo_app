import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_image_view.dart';
import '../widgets/custom_tag_checkout_widget.dart';
import 'blocs/choose_date/choose_date_bloc.dart';
import 'blocs/choose_guest/choose_guest_bloc.dart';
import 'blocs/choose_room/choose_room_bloc.dart';

class BookingDateWidget extends StatelessWidget {
  const BookingDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final roomState = context.watch<ChooseRoomBloc>().state;
    final guestState = context.watch<ChooseGuestBloc>().state;
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          context.goNamed(bookingDateRoute);
        },
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h, bottom: 16.h),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CustomImageView(
                              height: 40.h,
                              width: 40.w,
                              imagePath: Assets.images.date,
                              radius: BorderRadius.circular(12.r))),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            l10n.bookingDateText,
                            style: theme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ChooseDateBloc, ChooseDateState>(
                  builder: (context, state) {
                    if (state.chooseDateStatus.isLoaded) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTimeBookingDate(
                                  onTap: () {
                                    context.goNamed(bookingDateRoute);
                                  },
                                  imagePath: Assets.images.checkInGroup1,
                                  title: l10n.checkInText,
                                  subtitle:
                                      '${state.dayStart}, ${state.monthStart} ${state.yearStart}'),
                              CustomTimeBookingDate(
                                  onTap: () {
                                    context.goNamed(bookingDateRoute);
                                  },
                                  imagePath: Assets.images.checkInGroup2,
                                  title: l10n.checkOutText,
                                  subtitle:
                                      '${state.dayEnd}, ${state.monthEnd} ${state.yearEnd}'),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              CustomImageView(
                                margin: EdgeInsets.only(right: 16.w),
                                height: 40.h,
                                width: 40.w,
                                imagePath: Assets.images.guest,
                              ),
                              Expanded(
                                  child: Text('${guestState.valueGuest} Guest',
                                      style: theme.bodyLarge)),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              CustomImageView(
                                margin: EdgeInsets.only(right: 16.w),
                                height: 40.h,
                                width: 40.w,
                                imagePath: Assets.images.bedPink,
                              ),
                              Expanded(
                                  child: Text('${roomState.valueRoom} Room',
                                      style: theme.bodyLarge)),
                            ],
                          )
                        ],
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: BtnAddInfoBookingWidget(
                          onTap: () {
                            context.goNamed(bookingDateRoute);
                          },
                          textBtn: l10n.addDateBtnText),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTimeBookingDate extends StatelessWidget {
  const CustomTimeBookingDate({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    //final l10n = context.l10n;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomImageView(
            height: 40.h,
            width: 40.w,
            imagePath: imagePath,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 12.sp, color: ColorConstant.black87Color),
                ),
                Text(
                  subtitle,
                  style: theme.bodyLarge,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
