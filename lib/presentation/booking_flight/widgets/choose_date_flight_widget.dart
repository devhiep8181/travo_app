import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../select_seat/blocs/choose_date_flight/choose_date_flight_bloc.dart';

class ChooseDateFlightWidget extends StatelessWidget {
  const ChooseDateFlightWidget({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.twoWay = false,
    this.returnDate = false,
    this.roundTrip = false,
    this.hideReturnDate = true,
    super.key,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final bool twoWay; // có phải đa chuyến không
  final bool returnDate; //có ngày về không
  final bool roundTrip; //cứ hồi
  final bool hideReturnDate; //ẩn return date
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dateState = context.watch<ChooseDateFlightBloc>().state;
    return InkWell(
      onTap: () {
        returnDate
            ? _showRoundDateTrip(context).then((value) {
                context.read<ChooseDateFlightBloc>().add(ChooseReturnDateEvent(
                    departureDate: value!.start, returnDate: value.end));
              })
            : _showDateTrip(context)
                .then((value) {
                twoWay
                    ? context.read<ChooseDateFlightBloc>().add(
                        ChooseDepartureDateEvent(
                            departureDate: value!, twoWay: twoWay))
                    : context.read<ChooseDateFlightBloc>().add(
                        ChooseDepartureDateEvent(
                            departureDate: value!, twoWay: twoWay));
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
                  ///Logic chỗ này như sau
                  ///Nếu ChooseDateFlightStatus
                  ///1. Loaed
                  ///TH1: Cứ hồi tức là roundTrip
                  ///Nếu RoundTrip true và hideReturnDate true => hiển thị ngày đi
                  ///Nếu RoundTrip true và hideReturnDate false => hiển thị ngày về
                  ///
                  ///Th2: Đa chuyến khi roundTrip false
                  ///Nếu twoWay true hiển thị ngày đi chuyến 2
                  ///Nếu twoWay false hiện thị ngày đi chuyến 1
                  ///2. !Loaed => trả về subtitle truyền vào
                  ///Không hiểu sao viết ra được chỗ này, mai đọc lại chắc lú luôn
                  Text(
                    dateState.chooseDateFlightStatus.isLoaded
                        ? roundTrip
                            ? hideReturnDate
                                ? dateState.depatureDate[
                                        TextConstant.keyDepatureFlight1] ??
                                    subtitle
                                : dateState.returnDate
                            : twoWay
                                ? dateState.depatureDate[
                                        TextConstant.keyDepatureFlight2] ??
                                    subtitle
                                : dateState.depatureDate[
                                        TextConstant.keyDepatureFlight1] ??
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

  Future<DateTime?> _showDateTrip(BuildContext context) {
    return showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2100));
  }

  Future<DateTimeRange?> _showRoundDateTrip(BuildContext context) {
    return showDateRangePicker(
              context: context,
              firstDate: DateTime(2024, 1, 1),
              lastDate: DateTime(2100, 12, 31),
              currentDate: DateTime.now(),
              saveText: 'Done',
            );
  }
}
