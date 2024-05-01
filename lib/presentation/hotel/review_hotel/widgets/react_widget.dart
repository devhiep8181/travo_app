import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../domain/entities/rating_entity.dart';
import '../blocs/count_react/count_react_bloc.dart';
import '../blocs/react/react_bloc.dart';

class ReactWidget extends StatelessWidget {
  const ReactWidget({
    required this.ratingEntity,
    required this.index,
    super.key,
  });
  final RatingEntity ratingEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReactBloc, ReactState>(
      listener: (context, state) {
        if (state.reactStatus.isLoaded) {
          context.read<CountReactBloc>().add(InitialCountReactEvent(
              index: index,
              value: valueStogareReact[ratingEntity.uid],
              countDislike: ratingEntity.countDislike ?? 0,
              countLike: ratingEntity.countlike ?? 0));
        }
      },
      child: Builder(builder: (context) {
        final countReactState = context.watch<CountReactBloc>().state;
  

        final likeOrDislike = countReactState.countReactStatus.isLoaded
            ? countReactState.likeOrDislike[index]
            : valueStogareReact[ratingEntity.uid];

        final like = ValueNotifier<bool>(likeOrDislike ?? false);
        final countlike =
            countReactState.countLike[index] ?? ratingEntity.countlike;
        final countDislike =
            countReactState.countDislike[index] ?? ratingEntity.countDislike;
        var dislike = ValueNotifier<bool>(likeOrDislike ?? false);
        if (likeOrDislike == true) {
          dislike = ValueNotifier<bool>(false);
        } else if (likeOrDislike == false) {
          dislike = ValueNotifier<bool>(true);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ).copyWith(bottom: 16),
          child: Row(
            children: [
              ValueListenableBuilder(
                valueListenable: like,
                builder: (_, __, ___) => IconButton(
                  onPressed: () {
                    like.value = !like.value;
                    context.read<CountReactBloc>().add(CountReactLikeEvent(
                        uid: ratingEntity.uid,
                        index: index,
                        countLike: countlike ?? 0,
                        like: like.value,
                        countDisLike: ratingEntity.countDislike ?? 0));
                  },
                  icon: Icon(Icons.thumb_up,
                      color: likeOrDislike == null
                          ? ColorConstant.grey500Color
                          : likeOrDislike == true
                              ? ColorConstant.blueAccentColor
                              : ColorConstant.grey500Color),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(countlike.toString()),
              SizedBox(
                width: 40.w,
              ),
              ValueListenableBuilder(
                valueListenable: dislike,
                builder: (_, __, ___) => IconButton(
                  onPressed: () {
                    dislike.value = !dislike.value;
                    context.read<CountReactBloc>().add(CountReactDisLikeEvent(
                        uid: ratingEntity.uid,
                        index: index,
                        countDislike: countDislike ?? 0,
                        disLike: dislike.value,
                        countLike: ratingEntity.countlike ?? 0));
                  },
                  icon: Icon(Icons.thumb_down,
                      color: likeOrDislike == null
                          ? ColorConstant.grey500Color
                          : likeOrDislike == false
                              ? ColorConstant.blueAccentColor
                              : ColorConstant.grey500Color),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(countDislike.toString()),
            ],
          ),
        );
      }),
    );
  }
}
