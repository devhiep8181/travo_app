import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../configs/cache/user_singleton.dart';
import '../../../../core/app_export.dart';
import '../../../../gen/assets.gen.dart';

import '../../../payment/payment_screen.dart';
import '../../blocs/review/review_bloc.dart';

import '../blocs/modify_review/modify_review_bloc.dart';
import '../blocs/react/react_bloc.dart';
import 'element_review.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) {
        if (state.reviewStatus.isLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state.reviewStatus.isLoaded && state.listRating.isNotEmpty) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: state.listRating.length, (context, index) {
            final rating = state.listRating[index];
            final checkValue = rating.emailUser == UserSingleton().email;
            context.read<ReactBloc>().add(GetValueReactEvent(
                uid: rating.uid, email: UserSingleton().email));

            if (checkValue) {
              return ElementBookingWidget(
                  keySlidable: index.toString(),
                  edit: true,
                  onPressed1: (context) {
                    context.read<ModifyReviewBloc>().add(GetModifyRevewEvent(
                        rating: rating, indexReview: index));
                    context.goNamed(writeReviewHotelRoute);
                  },
                  onPressed: (context) {
                    context
                        .read<ReviewBloc>()
                        .add(DeleteReviewEvent(uid: rating.uid));
                    context.read<ReactBloc>().add(DeleteValueReactEvent(
                        uid: rating.uid, email: UserSingleton().email));
                  },
                  child: ElementReview(
                    rating: rating,
                    index: index,
                  ));
            } else {
              return ElementReview(
                rating: rating,
                index: index,
              );
            }
          }));
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: Lottie.asset(Assets.animation.notFound),
            ),
          );
        }
      },
    );
  }
}
