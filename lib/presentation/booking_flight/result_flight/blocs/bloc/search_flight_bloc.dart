import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_flight_event.dart';
part 'search_flight_state.dart';

class SearchFlightBloc extends Bloc<SearchFlightEvent, SearchFlightState> {
  SearchFlightBloc() : super(SearchFlightInitial()) {
    on<SearchFlightEvent>((event, emit) {
    });
  }
}
