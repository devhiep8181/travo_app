part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class GetPhotoEvent extends PhotoEvent {
  const GetPhotoEvent({
    required this.photos,
  });
  final List<String> photos;
  
  @override
  List<Object> get props => [photos];
}

class AddPhotoEvent extends PhotoEvent {
  const AddPhotoEvent({
    required this.photo,
  });
  final String photo;

  @override
  List<Object> get props => [photo];
}

class DeletePhotoEvent extends PhotoEvent {
  const DeletePhotoEvent({
    required this.photo,
  });
  final String photo;

  @override
  List<Object> get props => [photo];
}
