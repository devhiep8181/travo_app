// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../../app/bloc/app_bloc.dart';
import '../../../../app/bloc/app_data.dart';
import '../../../../core/app_export.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/export_widgets.dart';
import '../../../payment/blocs/modify_or_choose_room/modify_or_choose_room_bloc.dart';

class ModelWidget extends StatelessWidget {
  const ModelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomItemModelWidget(
          color: ColorConstant.deepCarrotOrangeColor.withOpacity(0.3),
          image: Assets.images.hotelModel,
          textModel: l10n.hotelModelText,
          onTap: () {
            context.read<ModifyOrChooseRoomBloc>().add(
                const ProcessModifyOrChooseRoomEvent(modifyBookingRoom: false));

            context.goNamed(hotleRoute);
          },
        ),
        CustomItemModelWidget(
          color: ColorConstant.salmonPinkColor,
          image: Assets.images.flight,
          textModel: l10n.flightsModelText,
          onTap: () {
            context.goNamed(bookingFlightRoute);
          },
        ),
        CustomItemModelWidget(
          color: ColorConstant.tealColor.withOpacity(0.3),
          image: Assets.images.flightHotel,
          textModel: l10n.allModelText,
        ),
      ],
    );
  }
}

class CustomItemModelWidget extends StatelessWidget {
  const CustomItemModelWidget({
    required this.color,
    required this.image,
    required this.textModel,
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  final Color? color;
  final String image;
  final String textModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 100.w,
            height: 75.h,
            decoration: BoxDecoration(
                color: color ??
                    ColorConstant.deepCarrotOrangeColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: CustomImageView(
                  imagePath: image,
                )),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            textModel,
            style: context.appTextTheme.bodyLarge?.copyWith(
                color: context.isAppInLightMode()
                    ? ColorConstant.blackColor
                    : ColorConstant.whiteColor),
          ),
        ],
      ),
    );
  }
}
