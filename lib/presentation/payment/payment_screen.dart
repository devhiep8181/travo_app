// Flutter imports:
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';

import '../../configs/cache/user_singleton.dart';
import '../../core/app_export.dart';
import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';
import '../../widgets/arrow_upward.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_image_view.dart';
import '../booking/confirm/booking/booking_bloc.dart';
import '../booking_flight/blocs/confirm_flight/confirm_flight_bloc.dart';
import 'widgets/app_bar_payment_widget.dart';
import 'widgets/info_booking_flight_widget.dart';
import 'widgets/item_room_booking.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  @override
  void initState() {
    super.initState();
    final email = UserSingleton().email;
    context.read<BookingBloc>().add(GetBookingEvent(email: email));
    context.read<ConfirmFlightBloc>().add(GetBookingFlightEvent(email: email));
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 200 && !_showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = true;
      });
    } else if (_scrollController.offset < 200 && _showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookingRoomStatus = context.watch<BookingBloc>().state;
    final bookingFlightStatus = context.watch<ConfirmFlightBloc>().state;
    final checkState = bookingFlightStatus.confirmFlightStatus.isError &&
        bookingRoomStatus.bookingStatus.isError;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            _showScrollToTopButton ? ArrowUpward(onTap: _scrollToTop) : null,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            AppBarLabelWidget(title: context.l10n.paymentLabel,),
            if (checkState)
              FutureBuilder<void>(
                  future: Future<dynamic>.delayed(const Duration(seconds: 2))
                      .then((value) => true),
                  builder: (context, snapshot) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Lottie.asset(Assets.animation.notFound),
                      ),
                    );
                  })
            else
              BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  if (state.bookingStatus.isLoaded) {
                    final listRoom = state.bookinglist;

                    return SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: listRoom.length, (context, index) {
                      return ElementBookingWidget(
                        keySlidable: index.toString(),
                        onPressed: (context) {
                          CustomDialog(context: context).showLoadingDialog();
                          context.read<BookingBloc>().add(
                              DeleteBookingRoomEvent(
                                  uid: listRoom[index].uidRoomBooking));
                        },
                        child: ItemRoomBooking(
                          bookingEntity: listRoom[index],
                        ),
                      );
                    }));
                  } else if (state.bookingStatus.isLoading) {
                    return const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
            BlocBuilder<ConfirmFlightBloc, ConfirmFlightState>(
              builder: (context, state) {
                if (state.confirmFlightStatus.isSuccess) {
                  final listFlight = state.bookingFlightEntity;
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: listFlight.length, (context, index) {
                    return ElementBookingWidget(
                      keySlidable: index.toString(),
                      onPressed: (context) {
                        CustomDialog(context: context).showLoadingDialog();
                        context.read<ConfirmFlightBloc>().add(
                            DeleteBookingFlightEvent(
                                uid: listFlight[index].uidBookingFlight ?? ''));
                      },
                      child: InfoBookingFlightWidget(
                          bookingFlightEntity: listFlight[index]),
                    );
                  }));
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30.h,
              ),
            )
          ],
        ));
  }
}

class ElementBookingWidget extends StatelessWidget {
  const ElementBookingWidget({
    required this.keySlidable,
    required this.onPressed,
    required this.child,
    this.edit = false,
    this.onPressed1,
    super.key,
  });

  final String keySlidable;
  final void Function(BuildContext)? onPressed;
  final Widget child;
  final bool edit;
  final void Function(BuildContext)? onPressed1;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(keySlidable),
      endActionPane: ActionPane(
        dragDismissible: false,
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20.r),
            onPressed: onPressed,
            backgroundColor: ColorConstant.redColor,
            foregroundColor: ColorConstant.whiteColor,
            icon: Icons.delete,
            label: 'Delete',
          ),
          if (edit)
            SlidableAction(
              borderRadius: BorderRadius.circular(20.r),
              onPressed: onPressed1,
              backgroundColor: ColorConstant.greenAccentColor,
              foregroundColor: ColorConstant.whiteColor,
              icon: Icons.edit,
              label: 'Edit',
            ),
        ],
      ),
      child: child,
    );
  }
}
