import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/app_localizations.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_image_view.dart';
import '../../booking/widgets/custom_tag_checkout_widget.dart';
import '../select_seat/blocs/chooose_class_flight/choose_class_flight_bloc.dart';
import '../select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';

List<String> classFlight = ['Economy', 'Bussiness'];

class ChooseClassFlightWidget extends StatelessWidget {
  const ChooseClassFlightWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final valuePassengers =
        context.select((ChoosePassengersBloc bloc) => bloc.state.passengers);
    final classFlight = context.watch<ChooseClassFlightBloc>().state;
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
                imagePath: Assets.images.economi,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.classText),
                  SizedBox(
                    height: 5.h,
                  ),
                  if (valuePassengers >= 2)
                    classFlight.valueClassFlight.length >= 2
                        ? InkWell(
                            onTap: () {
                              context
                                  .read<ChoosePassengersBloc>()
                                  .add(ExitChangeStatusEvent());

                              context.goNamed(addClassRoute);
                            },
                            child: SizedBox(
                              height: 100.h,
                              width: 150.w,
                              child: ListView.builder(
                                  itemCount:
                                      classFlight.valueClassFlight.length,
                                  itemBuilder: (context, index) {
                                    final indexValue = index + 1;
                                    final itemClassFligth =
                                        classFlight.valueClassFlight;
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 15.r,
                                            backgroundColor:
                                                ColorConstant.salmonPinkColor,
                                            child: Icon(
                                              Icons.airline_seat_recline_extra,
                                              color: ColorConstant.pinkColor
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                          Text('$indexValue :'),
                                          Text(itemClassFligth[indexValue]
                                              .toString()),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : _buildAddBtnClassFlight(context, l10n)
                  else
                    const RadioClassFlightWidget(
                      indexPassengers: 1,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildAddBtnClassFlight(BuildContext context, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BtnAddInfoBookingWidget(
          onTap: () {
            context.read<ChoosePassengersBloc>().add(ExitChangeStatusEvent());
            context.goNamed(addClassRoute);
          },
          textBtn: l10n.addClassFlightText),
    );
  }
}

class RadioClassFlightWidget extends StatefulWidget {
  const RadioClassFlightWidget({
    required this.indexPassengers,
    super.key,
  });
  final int indexPassengers;

  @override
  State<RadioClassFlightWidget> createState() => _RadioClassFlightWidgetState();
}

class _RadioClassFlightWidgetState extends State<RadioClassFlightWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ChooseClassFlightBloc>().add(ProcessClassFlightEvent(
        valueClassFlight: classFlight[0],
        indexClassFlight: widget.indexPassengers));
  }

  @override
  Widget build(BuildContext context) {
    final valueRadio =  ValueNotifier<String>(classFlight[0]);
    return ValueListenableBuilder(
      valueListenable: valueRadio,
      builder: (_, __, ___) => Column(
        children: List.generate(
          2,
          (index) => Row(
            children: [
              Radio(
                  value: classFlight[index],
                  groupValue: valueRadio.value,
                  onChanged: (value) {
                    if (value != null) {
                      valueRadio.value = value;
                      context.read<ChooseClassFlightBloc>().add(
                          ProcessClassFlightEvent(
                              valueClassFlight: valueRadio.value,
                              indexClassFlight: widget.indexPassengers));
                    }
                  }),
              Text(classFlight[index]),
            ],
          ),
        ),
      ),
    );
  }
}
