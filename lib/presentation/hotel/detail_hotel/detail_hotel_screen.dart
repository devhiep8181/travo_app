import 'package:flutter/material.dart';


import '../../../domain/entities/hotel_entity.dart';

import 'widgets/detail_hotel_widget.dart';
import 'widgets/image_detail_hotel_widget.dart';

class DetailHotelScreen extends StatelessWidget {
  const DetailHotelScreen({
    required this.hotelEntity,
    super.key,
  });
  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: [
            // OnboardingScreen(),
            ImageDetailHotelWidget(
              image: hotelEntity.image,
            ),
            DetailHotelWidget(
              hotelEntity: hotelEntity,
            ),
          ],
        ),
      ),
    );
  }
}



