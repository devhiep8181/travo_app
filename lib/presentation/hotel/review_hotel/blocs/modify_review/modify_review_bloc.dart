import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/rating_entity.dart';

part 'modify_review_event.dart';
part 'modify_review_state.dart';

class ModifyReviewBloc extends Bloc<ModifyReviewEvent, ModifyReviewState> {
  ModifyReviewBloc()
      : super(const ModifyReviewState(
            photos: [],
            indexReview: 0,
            rating: RatingEntity(
                comment: '',
                hotelId: '',
                photos: [],
                ratedTime: '',
                rating: 0,
                emailUser: '',
                countlike: 0,
                countDislike: 0,
                uid: ''),
            modifyReviewStatus: ModifyReviewStatus.initial,
            modify: false)) {
    on<GetModifyRevewEvent>(_onGetModifyRevewEvent);
    on<NoModifyReviewEvent>(_onNoModifyReviewEvent);
    on<UpdatePhotoReviewEvent>(_onUpdatePhotoReviewEvent);
    on<DeletePhotoReviewEvent>(_onDeletePhotoReviewEvent);
  }

  FutureOr<void> _onGetModifyRevewEvent(
      GetModifyRevewEvent event, Emitter<ModifyReviewState> emit) {
    emit(state.copyWith(modifyReviewStatus: ModifyReviewStatus.loading));
    try {
      final listPhotoResult = <String>[];
      for (final entity in event.rating.photos ?? []) {
        listPhotoResult.add(entity.toString());
      }

      emit(state.copyWith(
        indexReview: event.indexReview,
          rating: event.rating,
          photos: listPhotoResult,
          modifyReviewStatus: ModifyReviewStatus.loaded,
          modify: true));
    } catch (e) {
      emit(state.copyWith(modifyReviewStatus: ModifyReviewStatus.error));
    }
  }

  void _onNoModifyReviewEvent(
      NoModifyReviewEvent event, Emitter<ModifyReviewState> emit) {
    emit(state.copyWith(
        modify: false, modifyReviewStatus: ModifyReviewStatus.loaded));
  }

  FutureOr<void> _onUpdatePhotoReviewEvent(
      UpdatePhotoReviewEvent event, Emitter<ModifyReviewState> emit) {
    print('photo: ${event.photo}');
    try {
      final listPhoto = List<String>.from(state.photos)..add(event.photo);
      emit(state.copyWith(
          photos: listPhoto, modifyReviewStatus: ModifyReviewStatus.loaded));
    } catch (e) {
      emit(state.copyWith(modifyReviewStatus: ModifyReviewStatus.error));
    }
  }

  FutureOr<void> _onDeletePhotoReviewEvent(
      DeletePhotoReviewEvent event, Emitter<ModifyReviewState> emit) {
    try {
      final listPhoto = List<String>.from(state.photos)..remove(event.photo);
      emit(state.copyWith(
          photos: listPhoto, modifyReviewStatus: ModifyReviewStatus.loaded));
    } catch (e) {
      emit(state.copyWith(modifyReviewStatus: ModifyReviewStatus.error));
    }
  }
}
