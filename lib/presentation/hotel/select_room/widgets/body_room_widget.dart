import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_export.dart';
import '../../../booking/book_and_review/blocs/room/room_choose_bloc.dart';
import '../../../payment/blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../../blocs/room/room_bloc.dart';
import 'info_room_widget.dart';

class BodyRoomWidget extends StatelessWidget {
  const BodyRoomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final modifyRoomBooking = context
        .select((ModifyOrChooseRoomBloc bloc) => bloc.state.modifyBookingRoom);
    return BlocBuilder<RoomBloc, RoomState>(
      builder: (context, state) {
        if (state.roomStatus.isLoaded) {
          final listRoom = state.listRoom;

          return SliverList.builder(
            itemCount: listRoom.length,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context
                      .read<RoomChooseBloc>()
                      .add(GetRoomChooseEvent(roomEntity: listRoom[index]));
                  if (modifyRoomBooking) {
                    context.goNamed(modifyBookingRoomRoute);
                  } else {
                    context.goNamed(bookAndReviewRoute);
                  }
                },
                child: InfoRoomWidget(room: listRoom[index])),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
