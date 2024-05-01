// Package imports:
import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../configs/cache/app_cache.dart';
import '../../../../core/app_export.dart';
import '../../../../domain/entities/place_entity.dart';

part 'favourite_home_event.dart';
part 'favourite_home_state.dart';

class FavouriteHomeBloc extends Bloc<FavouriteHomeEvent, FavouriteHomeState> {
  FavouriteHomeBloc()
      : super(FavouriteHomeState(
            valueCheckFavourite: const {},
            listFavouritePlace: const [],
            favouriteHomeStatus: FavouriteHomeStatus.initial.path)) {
    on<AddFavouriteHomeEvent>(_onAddFavouriteHomeEvent);
    on<GetFavouriteHomeEvent>(_onGetFavouriteHomeEvent);
  }

  FutureOr<void> _onAddFavouriteHomeEvent(
      AddFavouriteHomeEvent event, Emitter<FavouriteHomeState> emit) async {
    try {
      emit(state.copyWith(
          favouriteHomeStatus: FavouriteHomeStatus.loading.path));
      final listFavouritePlace =
          List<PlaceEntity>.from(state.listFavouritePlace);
      final valueCheckFavourite =
          Map<String, dynamic>.from(state.valueCheckFavourite);

      //logic
      if (!listFavouritePlace.contains(event.favouritePlace) &&
          event.valueCheckFavourite) {
        listFavouritePlace.add(event.favouritePlace);
        valueCheckFavourite[event.favouritePlace.name] =
            event.valueCheckFavourite;
      } else {
        listFavouritePlace.remove(event.favouritePlace);
        valueCheckFavourite[event.favouritePlace.name] =
            event.valueCheckFavourite;
      }
      final stateToJson = state.copyWith(
          valueCheckFavourite: valueCheckFavourite,
          listFavouritePlace: listFavouritePlace,
          favouriteHomeStatus: FavouriteHomeStatus.success.path);

      final userUid = await AppCache.getString(TextConstant.keyUid);
      print('get uid: $userUid');
      await AppCache.setString(
          '$userUid${TextConstant.keyFavourite}', stateToJson.toJson());

      emit(stateToJson);
    } catch (e) {
      emit(state.copyWith(favouriteHomeStatus: FavouriteHomeStatus.error.path));
    }
  }

  FutureOr<void> _onGetFavouriteHomeEvent(
      GetFavouriteHomeEvent event, Emitter<FavouriteHomeState> emit) async {
    final userUid = await AppCache.getString(TextConstant.keyUid);
    final favourite =
        await AppCache.getString('$userUid${TextConstant.keyFavourite}');
    if (favourite != null) {
      final favouriteState = FavouriteHomeState.fromJson(favourite);
      emit(favouriteState);
    } else {
      emit(state.copyWith(favouriteHomeStatus: FavouriteHomeStatus.error.path));
    }
  }
}
