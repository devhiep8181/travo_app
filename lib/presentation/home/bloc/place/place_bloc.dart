// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../../core/app_export.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/place_entity.dart';
import '../../../../domain/usecases/place/get_place_usecase.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  PlaceBloc({required this.getPlaceUseCase}) : super(PlaceInitial()) {
    on<PlaceEvent>(_onPlaceEvent);
  }
  final GetPlaceUseCase getPlaceUseCase;

  FutureOr<void> _onPlaceEvent(
      PlaceEvent event, Emitter<PlaceState> emit) async {
    try {
      emit(PlaceLoading());
      final result = await getPlaceUseCase(NoParams());
      result.fold(
          (failure) => failure is OfflineFailure
              ? emit(PlaceNoConnect(message: TextConstant.noConnection))
              : emit(PlaceNoConnect(
                  message: (failure as ServerFailure).message ??
                      TextConstant.defaultErrorMessage)),
          (success) => emit(PlaceLoaded(listPlaceEntity: success)));
    } catch (e) {
      emit(PlaceError(message: e.toString()));
    }
  }
}
