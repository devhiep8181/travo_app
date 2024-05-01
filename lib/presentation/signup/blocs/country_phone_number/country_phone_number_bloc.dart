// Package imports:


// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../widgets/registration_form_widget/country_code/country_code.dart';

part 'country_phone_number_event.dart';
part 'country_phone_number_state.dart';

class CountryPhoneNumberBloc
    extends Bloc<CountryPhoneNumberEvent, CountryPhoneNumberState> {
  CountryPhoneNumberBloc() : super(CountryPhoneNumberInitial()) {
    on<ProcessCountryPhoneNumberEvent>(_onProcessCountryPhoneNumberEvent);
  }

  void _onProcessCountryPhoneNumberEvent(ProcessCountryPhoneNumberEvent event,
      Emitter<CountryPhoneNumberState> emit) {
    emit(
        CountryPhoneNumberInitial()); //chỗ này nghĩ ra hay phết => đổi trạng thái trước rồi mới đổi lại lần nữa
    emit(CountryPhoneNumberSelectState(
        phoneNumber: countryCode[event.countryNameSelect]!,
        countryName: event.countryNameSelect));
  }
}
