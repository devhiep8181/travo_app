part of 'country_bloc.dart';

enum CountryStatus { initial, loaded }

extension CountryStatusX on CountryStatus {
  bool get isLoaded => [CountryStatus.loaded].contains(this);
}

class CountryState extends Equatable {
  const CountryState(
      {required this.countryCode,
      required this.countryName,
      required this.countryStatus});
  final String countryName;
  final String countryCode;
  final CountryStatus countryStatus;

  @override
  List<Object> get props => [countryCode, countryName, countryStatus];

  CountryState copyWith({
    String? countryName,
    String? countryCode,
    CountryStatus? countryStatus,
  }) {
    return CountryState(
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
      countryStatus: countryStatus ?? this.countryStatus,
    );
  }
}
