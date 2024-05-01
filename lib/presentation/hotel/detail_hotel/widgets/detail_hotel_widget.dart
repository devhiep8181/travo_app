
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../../domain/entities/hotel_entity.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../select_room/blocs/bloc/id_room_bloc.dart';
import '../../widgets/info_hotel_widget.dart';
import 'reviews_hotel_widget.dart';
import 'service_hotel_widget.dart';
import 'title_hotel_widget.dart';

class DetailHotelWidget extends StatelessWidget {
  const DetailHotelWidget({
    required this.hotelEntity,
    super.key,
  });
  final HotelEntity hotelEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return DraggableScrollableSheet(
      initialChildSize: 0.2, // Kích thước ban đầu của sheet (từ 0.1 đến 1)
      minChildSize: 0.2, // Kích thước tối thiểu của sheet (từ 0 đến 1)
      maxChildSize: 0.7, // Kích thước tối đa của sheet (từ 0 đến 1)
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.black87Color.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20.r)),
                      width: 50.w,
                      height: 3.h,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TitleHotelWidget(hotelEntity: hotelEntity),
                  SizedBox(
                    height: 8.h,
                  ),
                  LocationWidget(entityHotel: hotelEntity),
                  dashedHote(),
                  ReviewsHotelWidget(hotelEntity: hotelEntity),
                  dashedHote(),
                  Text(
                    l10n.infomationText,
                    style: theme.titleLarge?.copyWith(fontSize: 16.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Text(
                      hotelEntity.information,
                      style: theme.bodyMedium,
                    ),
                  ),
                  const ServiceHotelWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(
                      l10n.locationText,
                      style: theme.bodyLarge?.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  Text(hotelEntity.locationDescription),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: CustomImageView(
                      fit: BoxFit.fitWidth,
                      imagePath: Assets.images.googleMap.path,
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      context
                          .read<IdRoomBloc>()
                          .add(GetIdRoom(idRoom: hotelEntity.id));
                      context.goNamed(selectRoomRoute);
                    },
                    textBtn: l10n.selectedRoomText,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Padding dashedHote() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: DashedWidget(
        color: ColorConstant.greyColor,
      ),
    );
  }
}
