part of 'country_phone_number_bloc.dart';

enum CountryPhoneNumberStatus { init, selectCountry }

class CountryPhoneNumberState extends Equatable {
  @override
  List<Object> get props => [];
}

class CountryPhoneNumberInitial extends CountryPhoneNumberState {}

class CountryPhoneNumberSelectState extends CountryPhoneNumberState {
  CountryPhoneNumberSelectState({
    required this.phoneNumber,
        required this.countryName,

  });
  final String phoneNumber;
    final String countryName;


  @override
  List<Object> get props => [phoneNumber, countryName];
}

// class GetCountryPhoneNumberState extends CountryPhoneNumberState {
//   GetCountryPhoneNumberState({
//     required this.phoneNumber,
//     required this.countryName,
//   });
//   final String phoneNumber;
//   final String countryName;

//   @override
//   List<Object> get props => [phoneNumber, countryName];
// }
