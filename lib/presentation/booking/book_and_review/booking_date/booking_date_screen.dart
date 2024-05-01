import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/export_widgets.dart';
import '../../../payment/blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../blocs/choose_date/choose_date_bloc.dart';
import '../blocs/choose_date/choose_date_data.dart';
import '../blocs/choose_guest/choose_guest_bloc.dart';
import '../blocs/choose_room/choose_room_bloc.dart';

class BookingDateScreen extends StatefulWidget {
  const BookingDateScreen({super.key});

  @override
  State<BookingDateScreen> createState() => _BookingDateScreenState();
}

class _BookingDateScreenState extends State<BookingDateScreen> {
  DateTimeRange? selectedDateRange;

  Future<void> _show() async {
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024, 1, 1),
      lastDate: DateTime(2040, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      setState(() {
        selectedDateRange = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final dateState = context.watch<ChooseDateBloc>().state;
    final modifyRoomBooking = context
        .select((ModifyOrChooseRoomBloc bloc) => bloc.state.modifyBookingRoom);
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.roomBookingText,
        subtitileText: l10n.roomBookingSubtitleText,
        onPressed: () {
          if (modifyRoomBooking) {
            context.goNamed(modifyBookingRoomRoute);
          } else {
            context.pop();
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const DestinationWidget(),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: _show,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      margin: EdgeInsets.only(right: 16.w),
                      height: 40.h,
                      width: 40.w,
                      imagePath: Assets.images.date,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.selectedDateText,
                          style: theme.bodyMedium?.copyWith(fontSize: 16.sp),
                        ),
                        if (dateState.chooseDateStatus ==
                            ChooseDateStatus.loaded)
                          Text(
                              '${dateState.dayStart} ${dateState.monthStart} - ${dateState.dayEnd} ${dateState.monthEnd}${dateState.yearEnd}',
                              style: theme.titleMedium)
                        else
                          selectedDateRange != null
                              ? Text(
                                  '${selectedDateRange!.start.day.toString().padLeft(2, '0')} ${monthData[selectedDateRange!.start.month.toString().padLeft(2, '0')]} - ${selectedDateRange!.end.day.toString().padLeft(2, '0')} ${monthData[selectedDateRange!.end.month.toString().padLeft(2, '0')]} ${selectedDateRange!.end.year.toString().padLeft(2, '0')}',
                                  style: theme.titleMedium)
                              : const SizedBox(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const GuestAndRoomWidget(),
            SizedBox(
              height: 16.h,
            ),
            CustomElevatedButton(
              onPressed: () {
                if (selectedDateRange != null) {
                  context.read<ChooseDateBloc>().add(ProcessDateEvent(
                      dayStart: selectedDateRange!.start.day
                          .toString()
                          .padLeft(2, '0'),
                      dayEnd:
                          selectedDateRange!.end.day.toString().padLeft(2, '0'),
                      monthStart: selectedDateRange!.start.month
                          .toString()
                          .padLeft(2, '0'),
                      monthEnd: selectedDateRange!.end.month
                          .toString()
                          .padLeft(2, '0'),
                      yearStart: selectedDateRange!.start.year
                          .toString()
                          .padLeft(2, '0'),
                      yearEnd: selectedDateRange!.end.year
                          .toString()
                          .padLeft(2, '0')));
                  if (modifyRoomBooking) {
                    context.goNamed(modifyBookingRoomRoute);
                  } else {
                    context.pop();
                  }
                } else {
                  CustomDialog(context: context).showCustomDialog(
                      notificationText: 'Please select a date',
                      dialogStatus: DialogStatus.error);
                }
              },
              textBtn: l10n.doneBtnText,
            ),
          ],
        ),
      ),
    );
  }
}

class GuestAndRoomWidget extends StatelessWidget {
  const GuestAndRoomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final roomState = context.watch<ChooseRoomBloc>().state;
    final guestState = context.watch<ChooseGuestBloc>().state;
    final l10n = context.l10n;
    return InkWell(
      onTap: () {
        context.goNamed(addGuestRoute);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            CustomImageView(
              margin: EdgeInsets.only(right: 16.w),
              height: 40.h,
              width: 40.w,
              imagePath: Assets.images.bedRoom,
            ),
            Column(
              children: [
                Text(
                  l10n.guestAndRoom,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  '${guestState.valueGuest} Guest, ${roomState.valueRoom} Room',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            margin: EdgeInsets.only(right: 16.w),
            height: 40.h,
            width: 40.w,
            imagePath: Assets.images.local,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextConstant.destinationText,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                'South Korea',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
