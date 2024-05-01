
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/custom_image_view.dart';
import '../blocs/choose_room/choose_room_bloc.dart';

class ChooseRoomWidget extends StatelessWidget {
  const ChooseRoomWidget({
    required this.valueRoom,
    super.key,
  });

  final TextEditingController valueRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          CustomImageView(
            margin: EdgeInsets.only(right: 16.w),
            height: 40.h,
            width: 40.w,
            imagePath: Assets.images.bedPink,
          ),
          const Expanded(child: Text('Room')),
          BlocBuilder<ChooseRoomBloc, ChooseRoomState>(
            builder: (context, state) {
              valueRoom.text = state.valueRoom;
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<ChooseRoomBloc>().add(
                            ReduceRoomEvent(valueRoom: valueRoom.text));
                      },
                      icon: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorConstant.redColor),
                          child: Icon(
                            Icons.remove,
                            color: ColorConstant.whiteColor,
                          ))),
                  SizedBox(
                    width: 35,
                    child: TextField(
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green))),
                      controller: valueRoom,
                      onChanged: (value) {
                        context
                            .read<ChooseRoomBloc>()
                            .add(ImportRoomEvent(valueRoom: value));
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<ChooseRoomBloc>().add(
                            IncreaseRoomEvent(
                                valueRoom: valueRoom.text));
                      },
                      icon: Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.greenColor,
                              borderRadius:
                                  BorderRadius.circular(100.r)),
                          child: Icon(
                            Icons.add,
                            color: ColorConstant.whiteColor,
                          ))),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}