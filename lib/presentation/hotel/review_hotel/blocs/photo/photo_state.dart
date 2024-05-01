part of 'photo_bloc.dart';

enum PhotoStatus { initial,loading, loaded, error }

extension PhotoStautsX on PhotoStatus {
  bool get isLoaded => [PhotoStatus.loaded].contains(this);
}

class PhotoState extends Equatable {
  const PhotoState({required this.photo, required this.photoStatus});
  final List<String> photo;
  final PhotoStatus photoStatus;
  @override
  List<Object> get props => [photo, photoStatus];

  PhotoState copyWith({
    List<String>? photo,
    PhotoStatus? photoStatus,
  }) {
    return PhotoState(
      photo: photo ?? this.photo,
      photoStatus: photoStatus ?? this.photoStatus,
    );
  }
}

