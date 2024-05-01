part of 'choose_location_bloc.dart';

enum ChooseLocationStatus { initial, loaded, error }

extension ChooseLocationStatusX on ChooseLocationStatus {
  bool get isLoaded => [ChooseLocationStatus.loaded].contains(this);
  bool get isError => [ChooseLocationStatus.error].contains(this);
}

class ChooseLocationState extends Equatable {
  const ChooseLocationState({
    required this.locationFromName,
    required this.locationToName,
    required this.locationStatus,
  });

  final Map<String, String> locationFromName;
  final Map<String, String> locationToName;
  final ChooseLocationStatus locationStatus;
  @override
  List<Object> get props => [locationStatus];

  ChooseLocationState copyWith({
    Map<String, String>? locationFromName,
    Map<String, String>? locationToName,
    ChooseLocationStatus? locationStatus,
  }) {
    return ChooseLocationState(
      locationFromName: locationFromName ?? this.locationFromName,
      locationToName: locationToName ?? this.locationToName,
      locationStatus: locationStatus ?? this.locationStatus,
    );
  }
}
