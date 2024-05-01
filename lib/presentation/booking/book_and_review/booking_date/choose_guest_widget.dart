import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/custom_image_view.dart';
import '../blocs/choose_guest/choose_guest_bloc.dart';

class ChooseGuestWidget extends StatelessWidget {
  const ChooseGuestWidget({
    required this.valueGuest,
    super.key,
  });

  final TextEditingController valueGuest;

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
            imagePath: Assets.images.guest,
          ),
          const Expanded(child: Text('Guest')),
          BlocBuilder<ChooseGuestBloc, ChooseGuestState>(
            builder: (context, state) {
              valueGuest.text = state.valueGuest;
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<ChooseGuestBloc>().add(
                            ReduceGuestEvent(
                                valueGuest: valueGuest.text));
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
                      controller: valueGuest,
                      onChanged: (value) {
                        context
                            .read<ChooseGuestBloc>()
                            .add(ImportGuestEvent(valueGuest: value));
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<ChooseGuestBloc>().add(
                            IncreaseGuestEvent(
                                valueGuest: valueGuest.text));
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
