import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_export.dart';
import '../../widgets/arrow_upward.dart';
import 'blocs/hotel/hotel_bloc.dart';
import 'widgets/appbar_hotel_widget.dart';
import 'widgets/body_hotel_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  @override
  void initState() {
    super.initState();
    context.read<HotelBloc>().add(GetHotelEvent());
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
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _showScrollToTopButton
          ? ArrowUpward(onTap: _scrollToTop)
          : null,
      body: RefreshIndicator(
        color: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.blueAccentColor,
        strokeWidth: 4.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: const [
            AppBarHotelWidget(),
            BodyHotelWidget(),
          ],
        ),
      ),
    );
  }
}


