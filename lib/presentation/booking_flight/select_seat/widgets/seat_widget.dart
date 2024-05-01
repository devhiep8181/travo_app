import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_constant.dart';
import '../blocs/choose_seat/choose_seat_bloc.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({
    required this.boolValueSeat,
    required this.nameSeat,
    required this.onTap,
    required this.seatClass,
    required this.seat,
    this.padding,
    super.key,
  });
  final bool boolValueSeat;
  final double? padding;
  final String nameSeat;
  final void Function()? onTap;
  final String seatClass;
  final String seat;

  @override
  Widget build(BuildContext context) {
    final valueSeat = context.watch<ChooseSeatBloc>().state;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(padding ?? 8),
        width: 28.w,
        height: 38.h,
        decoration: BoxDecoration(
            color: valueSeat.seats[seatClass]?[seat] ?? false
                ? ColorConstant.primaryColor
                : boolValueSeat
                    ? ColorConstant.grey500Color
                    : ColorConstant.whiteColor,
            border: Border.all(
                color: ColorConstant.grey500Color.withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(8.r)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(nameSeat),
        ),
      ),
    );
  }
}
