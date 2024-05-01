part of 'favourite_home_bloc.dart';

enum FavouriteHomeStatus {
  initial('inittial'),
  loading('loading'),
  success('success'),
  error('error');

  const FavouriteHomeStatus(this.path);
  final String path;
}

extension FavouriteHomeStatusX on FavouriteHomeStatus {
  bool get isLoadingOrSuccess => [
        FavouriteHomeStatus.loading.path,
        FavouriteHomeStatus.success.path,
      ].contains(path);
}

class FavouriteHomeState extends Equatable {
  factory FavouriteHomeState.fromJson(String source) =>
      FavouriteHomeState.fromMap(json.decode(source) as Map<String, dynamic>);

  factory FavouriteHomeState.fromMap(Map<String, dynamic> map) {
    return FavouriteHomeState(
        valueCheckFavourite: map['valueCheckFavourite'] as Map<String, dynamic>,
        listFavouritePlace: (map['listFavouritePlace'] as List<dynamic>)
            .map((e) => PlaceEntity.fromMap(e as Map<String, dynamic>))
            .toList(),
        favouriteHomeStatus: map['favouriteHomeStatus'] as String);
  }
  const FavouriteHomeState(
      {required this.valueCheckFavourite,
      required this.listFavouritePlace,
      required this.favouriteHomeStatus});

  final Map<String, dynamic> valueCheckFavourite;
  final List<PlaceEntity> listFavouritePlace;
  final String favouriteHomeStatus;

  @override
  List<Object> get props => [valueCheckFavourite, listFavouritePlace];

  FavouriteHomeState copyWith({
    Map<String, dynamic>? valueCheckFavourite,
    List<PlaceEntity>? listFavouritePlace,
    String? favouriteHomeStatus,
  }) {
    return FavouriteHomeState(
      valueCheckFavourite: valueCheckFavourite ?? this.valueCheckFavourite,
      listFavouritePlace: listFavouritePlace ?? this.listFavouritePlace,
      favouriteHomeStatus: favouriteHomeStatus ?? this.favouriteHomeStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'valueCheckFavourite': valueCheckFavourite,
      'listFavouritePlace': listFavouritePlace.map((x) => x.toMap()).toList(),
      'favouriteHomeStatus': favouriteHomeStatus
    };
  }

  String toJson() => json.encode(toMap());
}
