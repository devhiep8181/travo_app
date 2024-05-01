// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import '../../core/app_export.dart';
import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';
import '../../widgets/custom_my_paint.dart';
import '../home/bloc/favourite_home/favourite_home_bloc.dart';
import '../home/widgets/body_home_widget/place_grid_view_widget/place_loaded_widget.dart';
import '../payment/widgets/app_bar_payment_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteHomeBloc>().add(GetFavouriteHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.blueAccentColor,
        strokeWidth: 4.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            AppBarLabelWidget(title: context.l10n.favouriteLabel),
            BlocBuilder<FavouriteHomeBloc, FavouriteHomeState>(
              builder: (context, state) {
                if (state.favouriteHomeStatus ==
                    FavouriteHomeStatus.success.path) {
                  if (state.listFavouritePlace.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Lottie.asset(Assets.animation.notFound),
                      ),
                    );
                  } else {
                    return PlaceLoadedWiget(listData: state.listFavouritePlace);
                  }
                }
                return SliverToBoxAdapter(
                  child: Center(
                    child: Lottie.asset(Assets.animation.notFound),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
