import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/color_constant.dart';
import '../../../widgets/custom_image_view.dart';
import '../select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';

class ChoosePassengersWidget extends StatelessWidget {
  const ChoosePassengersWidget({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    super.key,
  });
  final String title;
  final String subtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final passengersState = context.watch<ChoosePassengersBloc>().state;
    return InkWell(
      onTap: () {
        context.read<ChoosePassengersBloc>().add(ExitChangeStatusEvent());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                margin: EdgeInsets.only(right: 16.w),
                imagePath: imagePath,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${passengersState.passengers} Passengers',
                    style: theme.bodyLarge,
                  ),
                ],
              ),
              if (passengersState.choosePassengersStatus.isLoaded)
                const SelectPassengersWidget()
              else
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            context
                                .read<ChoosePassengersBloc>()
                                .add(ChangeStatusEvent());
                          },
                          icon: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: ColorConstant.greenColor,
                            child: Text(
                              passengersState.passengers.toString(),
                              style: theme.bodyMedium
                                  ?.copyWith(color: ColorConstant.whiteColor),
                            ),
                          )),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectPassengersWidget extends StatefulWidget {
  const SelectPassengersWidget({
    super.key,
  });

  @override
  State<SelectPassengersWidget> createState() => _SelectPassengersWidgetState();
}

class _SelectPassengersWidgetState extends State<SelectPassengersWidget> {
  final valuePassenger = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final passengersState = context.watch<ChoosePassengersBloc>().state;
    valuePassenger.text = passengersState.passengers.toString();
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                context
                    .read<ChoosePassengersBloc>()
                    .add(ReducePassegerEvent(passeger: valuePassenger.text));
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
            width: 40.w,
            child: TextField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
              controller: valuePassenger,
              onChanged: (value) {
                context
                    .read<ChoosePassengersBloc>()
                    .add(ImportPassegerEvent(passeger: valuePassenger.text));
              },
            ),
          ),
          IconButton(
              onPressed: () {
                context
                    .read<ChoosePassengersBloc>()
                    .add(IncreasePassegerEvent(passeger: valuePassenger.text));
              },
              icon: Container(
                  decoration: BoxDecoration(
                      color: ColorConstant.greenColor,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Icon(
                    Icons.add,
                    color: ColorConstant.whiteColor,
                  ))),
        ],
      ),
    );
  }
}
