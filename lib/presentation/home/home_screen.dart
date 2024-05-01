// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:

import '../../core/app_export.dart';
import '../../widgets/arrow_upward.dart';
import 'bloc/favourite_home/favourite_home_bloc.dart';
import 'bloc/place/place_bloc.dart';
import 'widgets/app_bar_home_widget.dart';

import 'widgets/body_home_widget/model_widget.dart';
import 'widgets/body_home_widget/place_grid_view_widget.dart';

import 'widgets/body_home_widget/text_popular_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  @override
  void initState() {
    super.initState();
    context.read<PlaceBloc>().add(const PlaceEvent());
    context.read<FavouriteHomeBloc>().add(GetFavouriteHomeEvent());
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 100 && !_showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = true;
      });
    } else if (_scrollController.offset < 100 && _showScrollToTopButton) {
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
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            _showScrollToTopButton ? ArrowUpward(onTap: _scrollToTop) : null,
        body: RefreshIndicator(
          color: ColorConstant.whiteColor,
          backgroundColor: ColorConstant.blueAccentColor,
          strokeWidth: 4.0,
          onRefresh: () async {
            return Future<void>.delayed(const Duration(seconds: 1))
                .then((value) {
              setState(() {});
            });
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 130.h,
                flexibleSpace: const AppBarHomeWidget(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: const ModelWidget(),
                ),
              ),
              const TextPopularWidget(),
              const PlaceGridViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
