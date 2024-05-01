import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/name_route.dart';
import '../../../../domain/entities/booking_entity.dart';
import '../../../../l10n/l10n.dart';
import '../../../booking/book_and_review/blocs/contact/contact_bloc.dart';
import '../../blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';
import '../../widgets/build_info_widget.dart';
import '../../widgets/info_tag_modify_widget.dart';

class ContactDetailModifyWidget extends StatelessWidget {
  const ContactDetailModifyWidget({
    required this.bookingEntity,
    super.key,
  });
  final BookingEntity bookingEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<ModifyOrChooseRoomBloc>()
            .add(const ProcessModifyOrChooseRoomEvent(modifyBookingRoom: true));
        context.goNamed(contactDetailModifyRoute);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            final stateModifyRoom =
                context.watch<ModifyOrChooseRoomBloc>().state;
            final stateContactDetailsRoom = context.watch<ContactBloc>().state;

            final checkValue =
                stateModifyRoom.modifyorChooseRoomStatus.isLoaded &&
                    stateContactDetailsRoom.contactStatus.isSuccess;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoTagModifyWidget(
                  title: context.l10n.contactDetailText,
                ),
                BuildInfoWidget(
                    icon: Icons.person,
                    label: 'Name:',
                    value: checkValue
                        ? stateContactDetailsRoom.userEnity.displayName ?? ''
                        : bookingEntity.nameGuest.toString()),
                SizedBox(height: 8.h),
                BuildInfoWidget(
                    icon: Icons.email,
                    label: 'Email:',
                    value: checkValue
                        ? stateContactDetailsRoom.userEnity.email
                        : bookingEntity.emailGuest.toString()),
                SizedBox(height: 8.h),
                BuildInfoWidget(
                    icon: Icons.phone,
                    label: 'Phone:',
                    value: checkValue
                        ? stateContactDetailsRoom.userEnity.phoneNumber ?? ''
                        : bookingEntity.phoneGuest.toString()),
              ],
            );
          }),
        ),
      ),
    );
  }
}
