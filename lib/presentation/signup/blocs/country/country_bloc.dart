
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc()
      : super(const CountryState(
            countryCode: '84',
            countryName: 'Viet Nam',
            countryStatus: CountryStatus.initial)) {
    on<GetCountryName>(_onGetCountryName);
  }

  void _onGetCountryName(GetCountryName event, Emitter<CountryState> emit) {
    return emit(state.copyWith(
        countryCode: event.countryCode, countryName: event.countryName, countryStatus: CountryStatus.loaded));
  }
}
