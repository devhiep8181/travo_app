
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_details_event.dart';
part 'contact_details_state.dart';

class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  ContactDetailsBloc() : super(const ContactDetailsState(name: '', email: '', phoneNumber: '', contactDetailsStatus: ContactDetailsStatus.initial)) {
    on<GetContactDetailsEvent>(_onGetContactDetailsEvent);
  }

  void _onGetContactDetailsEvent(
      GetContactDetailsEvent event, Emitter<ContactDetailsState> emit) {
    try {
      emit(state.copyWith(
          name: event.name,
          phoneNumber: event.phoneNumber,
          email: event.email,
          contactDetailsStatus: ContactDetailsStatus.loaded
          ));
    } catch (e) {
      emit(state.copyWith(contactDetailsStatus: ContactDetailsStatus.error));
    }
  }
}
