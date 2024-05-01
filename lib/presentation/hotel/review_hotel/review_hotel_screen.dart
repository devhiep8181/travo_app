import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/arrow_upward.dart';

import 'widgets/appbar_review_hotel_widget.dart';
import 'widgets/comment_widget.dart';
import 'widgets/floating_action_review_widget.dart';
import 'widgets/rating_over_view_widget.dart';

class ReviewHotelScreen extends StatefulWidget {
  const ReviewHotelScreen({super.key});

  @override
  State<ReviewHotelScreen> createState() => _ReviewHotelScreenState();
}

class _ReviewHotelScreenState extends State<ReviewHotelScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 300 && !_showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = true;
      });
    } else if (_scrollController.offset < 300 && _showScrollToTopButton) {
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
    return Scaffold(
      floatingActionButtonLocation: _showScrollToTopButton
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      floatingActionButton: _showScrollToTopButton
          ? ArrowUpward(onTap: _scrollToTop)
          : const FloatingActionReviewWidget(),
      body: RefreshIndicator(
           color: ColorConstant.whiteColor,
          backgroundColor: ColorConstant.blueAccentColor,
          strokeWidth: 4.0,
          onRefresh: () async {
            return Future<void>.delayed(const Duration(milliseconds: 500))
                .then((value) {
              setState(() {});
            });
          },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: const [
            AppBarReviewHotelWidget(),
            RatingOverViewWidget(),
            CommentWidget(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
