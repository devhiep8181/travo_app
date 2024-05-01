import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../../configs/cache/user_singleton.dart';
import '../../../../domain/entities/rating_entity.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../blocs/review/review_bloc.dart';
import '../blocs/count_rating/count_rating_bloc.dart';
import '../blocs/count_react/count_react_bloc.dart';
import '../blocs/modify_review/modify_review_bloc.dart';
import '../blocs/photo/photo_bloc.dart';
import '../blocs/react/react_bloc.dart';

class DoneCommentBtn extends StatelessWidget {
  const DoneCommentBtn({
    required this.comment,
    super.key,
  });
  final TextEditingController comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Builder(builder: (context) {
        final reviewState = context.watch<ReviewBloc>().state;
        final rating = context.watch<CountRatingBloc>().state;
        final modifyReview = context.watch<ModifyReviewBloc>().state;
        final photoState = context.watch<PhotoBloc>().state;
        final reactState = context.watch<CountReactBloc>().state;
        bool? likeOrDislike; //false: dislike, true: like, null: no react
        if (reactState.dislike[modifyReview.indexReview] ?? false) {
          likeOrDislike = false;
        }
        if (reactState.like[modifyReview.indexReview] ?? false) {
          likeOrDislike = true;
        }
        return BlocListener<ReviewBloc, ReviewState>(
          listener: (context, state) {
            if (state.reviewStatus.isLoaded) {
              CustomDialog(context: context).showCustomDialog(
                notificationText: 'Done',
                dialogStatus: DialogStatus.success,
              );
              Future<dynamic>.delayed(const Duration(seconds: 2))
                  .then((value) => context.pop());
            }
          },
          child: CustomElevatedButton(
            onPressed: () {
              if (comment.text.isEmpty || rating.rating == 0) {
                CustomDialog(context: context).showLoadingDialog();
                if (comment.text.isEmpty) {
                  Future<dynamic>.delayed(const Duration(seconds: 1)).then((_) {
                    CustomDialog(context: context).showCustomDialogNoAutoOff(
                        notificationText: 'Review is not empty',
                        dialogStatus: DialogStatus.error);
                  });
                }else{
                    Future<dynamic>.delayed(const Duration(seconds: 1)).then((_) {
                    CustomDialog(context: context).showCustomDialogNoAutoOff(
                        notificationText: 'Not Rating',
                        dialogStatus: DialogStatus.error);
                  });
                }
              } else {
                CustomDialog(context: context).showLoadingDialog();
                if (modifyReview.modify) {
                  context.read<ReviewBloc>().add(UpdateReviewEvent(
                        likeOrDislike: likeOrDislike,
                        photo: modifyReview.photos,
                        comment: comment.text,
                        rating: rating.rating,
                        uid: modifyReview.rating.uid,
                        ratedTime: DateTime.now().toIso8601String(),
                      ));
                } else {
                  final uid = const Uuid().v4();
                  context.read<ReactBloc>().add(PushValueReactEvent(
                      uid: uid, email: UserSingleton().email));

                  context.read<ReviewBloc>().add(PushReviewEvent(
                          ratingEntity: RatingEntity(
                        comment: comment.text,
                        hotelId: reviewState.idHotel,
                        photos: photoState.photo,
                        ratedTime: DateTime.now().toIso8601String(),
                        rating: rating.rating,
                        emailUser: UserSingleton().email,
                        countlike: Random().nextInt(101),
                        countDislike: Random().nextInt(50),
                        uid: uid,
                      )));
                }
              }
            },
            textBtn: context.l10n.doneBtnText,
          ),
        );
      }),
    );
  }
}
