import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lottie/lottie.dart';
import '../../../gen/assets.gen.dart';
import '../blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../widgets/app_bar_modify_booking_widget.dart';
import 'widgets_booking_room/booking_date_modify_widget.dart';
import 'widgets_booking_room/contact_detail_modify_widget.dart';
import 'widgets_booking_room/done_booking_room_modify_btn.dart';
import 'widgets_booking_room/name_room_modify_widget.dart';

class ModifyBookingRoomScreen extends StatelessWidget {
  const ModifyBookingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppbarModifyBookingWidget(title: 'Room Booking',),
          BlocBuilder<ModifyOrChooseRoomBloc, ModifyOrChooseRoomState>(
            builder: (context, state) {
              if (state.modifyorChooseRoomStatus.isLoaded) {
                final bookingEntity = state.bookingEntity;
                return SliverList(
                  delegate: SliverChildListDelegate([
                    NameRoomModifyWidget(bookingEntity: bookingEntity),
                    ContactDetailModifyWidget(bookingEntity: bookingEntity),
                    BookingDateModifyWidget(bookingEntity: bookingEntity),
                    const DoneBookingRoomModifyBtn(),
                  ]),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Lottie.asset(Assets.animation.notFound),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

