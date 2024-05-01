part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeAppEvent extends AppEvent {
  const ChangeThemeAppEvent({
    required this.appTheme,
  });
  final bool appTheme;

  @override
  List<Object> get props => [appTheme];
}

class ChangLaguageAppEvent extends AppEvent {
  const ChangLaguageAppEvent({
    required this.appLanguage,
  });
  final bool appLanguage;

  @override
  List<Object> get props => [appLanguage];
}
