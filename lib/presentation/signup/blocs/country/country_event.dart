part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class GetCountryName extends CountryEvent {
  const GetCountryName({
    required this.countryName,
    required this.countryCode,
  });
  final String countryName;
  final String countryCode;
  
  @override
  List<Object> get props => [countryCode, countryName];
}
