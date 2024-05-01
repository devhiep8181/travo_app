part of 'react_bloc.dart';

enum ReactStatus { initial, loading, loaded, error }

extension ReactStatusX on ReactStatus {
  bool get isLoaded => [ReactStatus.loaded].contains(this);
}

class ReactState extends Equatable {
  const ReactState({
    required this.valueReact,
    required this.reactStatus,
    required this.message,
    required this.listReact,
  });
  final Map<String, bool?> valueReact;
  final List<bool> listReact;
  final ReactStatus reactStatus;
  final String message;
  @override
  List<Object> get props => [reactStatus, message, valueReact, listReact];

  ReactState copyWith({
    Map<String, bool?>? valueReact,
    List<bool>? listReact,
    ReactStatus? reactStatus,
    String? message,
  }) {
    return ReactState(
      valueReact: valueReact ?? this.valueReact,
      listReact: listReact ?? this.listReact,
      reactStatus: reactStatus ?? this.reactStatus,
      message: message ?? this.message,
    );
  }
}
