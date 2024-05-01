import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc()
      : super(const PhotoState(photo: [], photoStatus: PhotoStatus.initial)) {
    on<AddPhotoEvent>(_onAddPhotoEvent);
    on<DeletePhotoEvent>(_onDeletePhotoEvent);
    on<GetPhotoEvent>(_onGetPhotoEvent);
  }

  FutureOr<void> _onAddPhotoEvent(
      AddPhotoEvent event, Emitter<PhotoState> emit) {
    try {
      final listPhoto = List<String>.from(state.photo)..add(event.photo);
      emit(state.copyWith(photo: listPhoto, photoStatus: PhotoStatus.loaded));
    } catch (e) {
      emit(state.copyWith(photoStatus: PhotoStatus.error));
    }
  }

  FutureOr<void> _onDeletePhotoEvent(
      DeletePhotoEvent event, Emitter<PhotoState> emit) {
    try {
      final listPhoto = List<String>.from(state.photo)..remove(event.photo);
      emit(state.copyWith(photo: listPhoto, photoStatus: PhotoStatus.loaded));
    } catch (e) {
      emit(state.copyWith(photoStatus: PhotoStatus.error));
    }
  }

  FutureOr<void> _onGetPhotoEvent(
      GetPhotoEvent event, Emitter<PhotoState> emit) {
    try {
      emit(
          state.copyWith(photo: event.photos, photoStatus: PhotoStatus.loaded));
    } catch (e) {
      emit(state.copyWith(photoStatus: PhotoStatus.error));
    }
  }
}
