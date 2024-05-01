part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

class PlaceInitial extends PlaceState {}

class PlaceLoading extends PlaceState {}

class PlaceLoaded extends PlaceState {
  const PlaceLoaded({
    required this.listPlaceEntity,
  });
  final List<PlaceEntity> listPlaceEntity;
  @override
  List<Object> get props => [listPlaceEntity];
}

class PlaceNoConnect extends PlaceState{
    const PlaceNoConnect({
    required this.message,
  });
  final String message;
  @override
  List<Object> get props => [message];
}

class PlaceError extends PlaceState {
  const PlaceError({
    required this.message,
  });
  final String message;
  @override
  List<Object> get props => [message];
}
