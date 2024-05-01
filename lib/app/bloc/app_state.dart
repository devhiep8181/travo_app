part of 'app_bloc.dart';

enum AppStatus {
  initial('inittial'),
  loading('loading'),
  loaded('loaded'),
  error('error');

  const AppStatus(this.path);
  final String path;
}

extension AppStatusX on AppStatus {
  bool get isLoaded => [AppStatus.loaded.path].contains(path);
}

class AppState extends Equatable {

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
        appStatus: map['appStatus'] as String,
        valueCheckTheme: map['valueCheckTheme'] as bool,
        valueCheckLanguage: map['valueCheckLanguage'] as bool);
  }
  const AppState({
    required this.appStatus,
    required this.valueCheckTheme,
    required this.valueCheckLanguage,
  });

  final String appStatus;

  final bool valueCheckTheme;
  final bool valueCheckLanguage;

  @override
  List<Object> get props => [valueCheckLanguage, appStatus, valueCheckTheme];

  AppState copyWith({
    String? appStatus,
    bool? valueCheckTheme,
    bool? valueCheckLanguage,
  }) {
    return AppState(
      appStatus: appStatus ?? this.appStatus,
      valueCheckTheme: valueCheckTheme ?? this.valueCheckTheme,
      valueCheckLanguage: valueCheckLanguage ?? this.valueCheckLanguage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appStatus': appStatus,
      'valueCheckTheme': valueCheckTheme,
      'valueCheckLanguage': valueCheckLanguage,
    };
  }
}
