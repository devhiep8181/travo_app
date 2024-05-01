import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../widgets/custom_image_view.dart';
import '../blocs/hotel/hotel_bloc.dart';
import 'list_hotel_widget.dart';

class BodyHotelWidget extends StatelessWidget {
  const BodyHotelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return  SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is HotelLoaded) {
          final listHotel = state.listHotel;
          return FutureBuilder<void>(
              future: Future.delayed(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListHotelWidget(listHotel: listHotel);
                } else {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  );
                }
              });
        } else if (state is NotFoundHotel) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
              child: Center(
                child: CustomImageView(
                    radius: BorderRadius.circular(20.r),
                    imagePath: Assets.images.notFound.path),
              ),
            ),
          );
        }
        return const SliverAppBar(
          title: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
