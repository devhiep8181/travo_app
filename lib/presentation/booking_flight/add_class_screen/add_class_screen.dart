import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_export.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_eleveted_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_my_paint.dart';
import '../select_seat/blocs/choose_passengers/choose_passengers_bloc.dart';
import '../widgets/choose_class_flight_widget.dart';

class AddClassScreen extends StatelessWidget {
  const AddClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;
    final valuePassengers =
        context.select((ChoosePassengersBloc bloc) => bloc.state.passengers);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            expandedHeight: 120.h,
            backgroundColor: ColorConstant.primaryColor,
            flexibleSpace: Stack(
              children: [
                Container(
                  color: ColorConstant.primaryColor,
                  width: MediaQuery.of(context).size.width,
                  height: 100.h,
                  child: CustomPaint(
                    painter: CustomMyPaint(),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 16,
                    right: 32,
                    child: Row(
                      children: [
                        const ButtonWidget(),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          l10n.bookYourFlightText,
                          style: theme.headlineLarge,
                        )
                      ],
                    ))
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(childCount: valuePassengers,
                  (context, index) {
            final indexPassengers = index + 1;
            return Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: Assets.images.person,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              'Passengers $indexPassengers',
                              style: theme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      RadioClassFlightWidget(indexPassengers: indexPassengers,),
                    ],
                  ),
                ));
          })),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  textBtn: l10n.doneBtnText),
            ),
          ),
        ],
      ),
    );
  }
}
