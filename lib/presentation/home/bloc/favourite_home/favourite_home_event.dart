part of 'favourite_home_bloc.dart';

abstract class FavouriteHomeEvent extends Equatable {
  const FavouriteHomeEvent();

  @override
  List<Object> get props => [];
}

class AddFavouriteHomeEvent extends FavouriteHomeEvent {
  const AddFavouriteHomeEvent({
    required this.valueCheckFavourite,
    required this.favouritePlace,
  });
  final bool valueCheckFavourite;
  final PlaceEntity favouritePlace;

  @override
  List<Object> get props => [valueCheckFavourite, favouritePlace];
}

class GetFavouriteHomeEvent extends FavouriteHomeEvent{}
