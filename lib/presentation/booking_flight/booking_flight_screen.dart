import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_export.dart';

import '../../l10n/l10n.dart';

import '../../widgets/arrow_upward.dart';
import '../../widgets/export_widgets.dart';
import '../payment/blocs/modify_or_choose_flight/modify_or_choose_flight_bloc.dart';
import 'widgets/build_choose_flight.dart';
import 'widgets/page_book_flight_widget.dart';

class BookingFlightScreen extends StatefulWidget {
  const BookingFlightScreen({super.key});

  @override
  State<BookingFlightScreen> createState() => _BookingFlightScreenState();
}

class _BookingFlightScreenState extends State<BookingFlightScreen> {
  int currentIndex = 0;
  PageController? _controller;
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 60 && !_showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = true;
      });
    } else if (_scrollController.offset < 60 && _showScrollToTopButton) {
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
    final l10n = context.l10n;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          _showScrollToTopButton ? ArrowUpward(onTap: _scrollToTop) : null,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
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
                    right: 50,
                    child: Row(
                      children: [
                        Builder(builder: (context) {
                          final modifyBookingFlight =
                              context.watch<ModifyOrChooseFlightBloc>().state;
                          return ButtonWidget(
                            onPressed: () {
                              if (modifyBookingFlight.modifyBookingFlight) {
                                context.goNamed(paymentRoute);
                              } else {
                                context.goNamed(homeRoute);
                              }
                            },
                          );
                        }),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          l10n.bookYourFlightText,
                          style: context.appTextTheme.headlineLarge,
                        )
                      ],
                    ))
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: List.generate(
                  3,
                  (index) => InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            _controller!.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        child: BuildChooseFlight(
                            index: index, currentIndex: currentIndex),
                      )),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => SizedBox(
                height: currentIndex == 2 ? 1000.h : 600.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    children: [
                      const PageBookFlightWidget(),
                      const PageBookFlightWidget(
                        roundTrip: true,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flight 1',
                            style: context.appTextTheme.titleMedium,
                          ),
                          const PageBookFlightWidget(
                            hideBtnSearch: true,
                          ),
                          Text(
                            'Flight 2',
                            style: context.appTextTheme.titleMedium,
                          ),
                          const PageBookFlightWidget(
                            twoWay: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
