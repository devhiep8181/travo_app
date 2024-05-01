import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../domain/entities/hotel_entity.dart';
import '../blocs/review/review_bloc.dart';
import 'image_hotel_widget.dart';
import 'info_hotel_widget.dart';

class ListHotelWidget extends StatelessWidget {
  const ListHotelWidget({
    required this.listHotel,
    super.key,
  });

  final List<HotelEntity> listHotel;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: listHotel.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          context.read<ReviewBloc>().add(GetReviewEvent(
              hotelId: listHotel[index].id,
              totalReview: listHotel[index].totalReview,
              rating: listHotel[index].rating));
      
         
          context.goNamed(reviewHotelRoute);
        },
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w, top: 20.h),
          child: Container(
            decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              children: [
                ImageHotelWidget(entityHotel: listHotel[index]),
                InfoHotelWidget(entityHotel: listHotel[index]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
