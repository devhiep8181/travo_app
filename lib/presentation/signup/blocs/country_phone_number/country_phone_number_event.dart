part of 'country_phone_number_bloc.dart';

abstract class CountryPhoneNumberEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class ProcessCountryPhoneNumberEvent extends CountryPhoneNumberEvent{
  ProcessCountryPhoneNumberEvent({required this.countryNameSelect});
  final String countryNameSelect;

    @override
  List<Object> get props => [countryNameSelect];
}

class GetCountryCodeEvent extends CountryPhoneNumberEvent{
    GetCountryCodeEvent({required this.countryNameSelect});
  final String countryNameSelect;

    @override
  List<Object> get props => [countryNameSelect];
}