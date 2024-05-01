part of 'choose_passengers_bloc.dart';

enum ChoosePassengersStatus { initial, loading, loaded, error }

extension ChoosePassengersStatusX on ChoosePassengersStatus {
  bool get isLoaded => [ChoosePassengersStatus.loaded].contains(this);
  bool get isLoading => [ChoosePassengersStatus.loading].contains(this);
}

class ChoosePassengersState extends Equatable {
  const ChoosePassengersState(
      {required this.choosePassengersStatus, required this.passengers});
  final int passengers;
  final ChoosePassengersStatus choosePassengersStatus;
  @override
  List<Object> get props => [passengers, choosePassengersStatus];

  ChoosePassengersState copyWith({
    int? passengers,
    ChoosePassengersStatus? choosePassengersStatus,
  }) {
    return ChoosePassengersState(
      passengers: passengers ?? this.passengers,
      choosePassengersStatus:
          choosePassengersStatus ?? this.choosePassengersStatus,
    );
  }
}
