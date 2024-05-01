import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/text_constant.dart';
import '../../../../domain/entities/rating_entity.dart';
import '../../../../domain/usecases/rating/delete_review_usecase.dart';
import '../../../../domain/usecases/rating/get_review_usecase.dart';
import '../../../../domain/usecases/rating/push_review_usecase.dart';
import '../../../../domain/usecases/rating/update_review_usecase.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc({
    required this.getReviewUseCase,
    required this.pushReviewUseCase,
    required this.deleteReviewUseCase,
    required this.updateReviewUseCase,
  }) : super(const ReviewState(
          reviewStatus: ReviewStatus.initial,
          listRating: [],
          message: '',
          idHotel: '',
          rating: 0,
          totalReview: 0,
        )) {
    on<GetReviewEvent>(_onGetReviewEvent);
    on<UpdateReviewEvent>(_onUpdateReviewEvent);
    on<DeleteReviewEvent>(_onDeleteReviewEvent);
    on<PushReviewEvent>(_onPushReviewEvent);
  }

  final GetReviewUseCase getReviewUseCase;
  final PushReviewUseCase pushReviewUseCase;
  final DeleteReviewUseCase deleteReviewUseCase;
  final UpdateReviewUseCase updateReviewUseCase;

  FutureOr<void> _onGetReviewEvent(
      GetReviewEvent event, Emitter<ReviewState> emit) async {
    emit(state.copyWith(reviewStatus: ReviewStatus.loading));
    try {
      final result = await getReviewUseCase(event.hotelId);
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(state.copyWith(message: TextConstant.noConnection))
              : emit(state.copyWith(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)), (success) {
        emit(state.copyWith(
          reviewStatus: ReviewStatus.loaded,
          listRating: success,
          idHotel: event.hotelId,
          totalReview: event.totalReview,
          rating: event.rating,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
          reviewStatus: ReviewStatus.error, idHotel: event.hotelId));
    }
  }

  FutureOr<void> _onUpdateReviewEvent(
      UpdateReviewEvent event, Emitter<ReviewState> emit) async {
    try {
      final listRating = List<RatingEntity>.from(state.listRating);
      final rating =
          listRating.where((element) => element.uid == event.uid).single;
      if (listRating.contains(rating)) {
        //final listPhotos = List<String>.from(rating.photos?? [])..add()
        //TODO: danh sách hiện tại chưa có chức năng xoá
        //nên tạm thời sẽ thay luôn
        final ratingUpdate = RatingEntity(
            comment: event.comment,
            hotelId: rating.hotelId,
            photos: event.photo,
            ratedTime: event.ratedTime,
            rating: event.rating,
            emailUser: rating.emailUser,
            countlike: rating.countlike,
            countDislike: rating.countDislike,
            uid: rating.uid,
            );

        listRating
          ..remove(rating)
          ..add(ratingUpdate);

        await updateReviewUseCase(ratingUpdate);

        emit(state.copyWith(
            reviewStatus: ReviewStatus.loaded, listRating: listRating));
      } else {
        emit(state.copyWith(reviewStatus: ReviewStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(reviewStatus: ReviewStatus.error));
    }
  }

  FutureOr<void> _onDeleteReviewEvent(
      DeleteReviewEvent event, Emitter<ReviewState> emit) async {
    try {
      final listRating = List<RatingEntity>.from(state.listRating);
      final rating =
          listRating.where((element) => element.uid == event.uid).single;
      if (listRating.contains(rating)) {
        listRating.remove(rating);
        await deleteReviewUseCase(event.uid);
        emit(state.copyWith(
            reviewStatus: ReviewStatus.loaded, listRating: listRating));
      } else {
        emit(state.copyWith(reviewStatus: ReviewStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(reviewStatus: ReviewStatus.error));
    }
  }

  FutureOr<void> _onPushReviewEvent(
      PushReviewEvent event, Emitter<ReviewState> emit) async {
    try {
      final rating = RatingEntity(
        comment: event.ratingEntity.comment,
        hotelId: event.ratingEntity.hotelId,
        photos: event.ratingEntity.photos,
        ratedTime: event.ratingEntity.ratedTime,
        rating: event.ratingEntity.rating,
        emailUser: event.ratingEntity.emailUser,
        countlike: event.ratingEntity.countlike,
        countDislike: event.ratingEntity.countDislike,
        uid: event.ratingEntity.uid,
      );
      await pushReviewUseCase(rating);
      final listRating = List<RatingEntity>.from(state.listRating)..add(rating);
      emit(state.copyWith(
          reviewStatus: ReviewStatus.loaded, listRating: listRating));
    } catch (e) {
      emit(state.copyWith(reviewStatus: ReviewStatus.error));
    }
  }
}
