import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc()
      : super(AppState(
            appStatus: AppStatus.loaded.path,
            valueCheckTheme: false,
            valueCheckLanguage: false)) {
    on<ChangeThemeAppEvent>(_onChangeThemeAppEvent);
    on<ChangLaguageAppEvent>(_onChangLaguageAppEvent);
  }

  void _onChangeThemeAppEvent(
      ChangeThemeAppEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(
        appStatus: AppStatus.loaded.path, valueCheckTheme: event.appTheme));
  }

  void _onChangLaguageAppEvent(
      ChangLaguageAppEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(
        appStatus: AppStatus.loaded.path,
        valueCheckLanguage: event.appLanguage));
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toMap();
  }
}
