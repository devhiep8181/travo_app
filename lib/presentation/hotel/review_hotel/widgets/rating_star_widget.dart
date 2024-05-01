import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_constant.dart';
import '../blocs/count_rating/count_rating_bloc.dart';
import '../blocs/modify_review/modify_review_bloc.dart';

class RatingStarWidget extends StatefulWidget {
  const RatingStarWidget({super.key});

  @override
  State<RatingStarWidget> createState() => _RatingStarWidgetState();
}

class _RatingStarWidgetState extends State<RatingStarWidget> {
  final _valueNotifier = ValueNotifier<List<bool>>(List.filled(5, false));
  int countStart = 0;
  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modifyState = context.watch<ModifyReviewBloc>().state;
    if (modifyState.modify) {
      countStart = modifyState.rating.rating ?? 0;
    } else {
      countStart = 0;
    }
    return Row(
      children: List.generate(5, (index) {
        return ValueListenableBuilder<List<bool>>(
          valueListenable: _valueNotifier,
          builder: (_, values, __) => IconButton(
            onPressed: () {
              final newValue = List<bool>.from(values);
              newValue[index] = !newValue[index];
              _valueNotifier.value = newValue;
              countStart = index + 1;
              if (!newValue[index]) {
                countStart--;
              }

              context
                  .read<CountRatingBloc>()
                  .add(ProcessCountRatingEvent(rating: countStart));
            },
            icon: Icon(
              Icons.star,
              color: index < countStart
                  ? ColorConstant.amberColor
                  : ColorConstant.grey500Color,
              size: 25.sp,
            ),
          ),
        );
      }),
    );
  }
}
