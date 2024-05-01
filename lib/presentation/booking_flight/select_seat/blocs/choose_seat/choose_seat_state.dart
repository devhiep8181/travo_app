part of 'choose_seat_bloc.dart';

enum ChooseSeatStatus { initial, loading, loaded, error }

extension ChooseSeatStatusX on ChooseSeatStatus {
  bool get isLoaded => [ChooseSeatStatus.loaded].contains(this);
}

class ChooseSeatState extends Equatable {
  const ChooseSeatState({
    required this.chooseSeat,
    required this.chooseSeatStatus,
    required this.classSeat,
    required this.seats,
    required this.countSeatsBussineesChoose,
    required this.countSeatsEnconomyChoose,
  });
  final Map<String, String> chooseSeat;
  final Map<String, String> classSeat;
  final Map<String, Map<String, bool>> seats;
  final int countSeatsBussineesChoose;
  final int countSeatsEnconomyChoose;
  final ChooseSeatStatus chooseSeatStatus;

  @override
  List<Object> get props => [chooseSeat, chooseSeatStatus, classSeat, countSeatsBussineesChoose, countSeatsEnconomyChoose];

  ChooseSeatState copyWith({
    Map<String, String>? chooseSeat,
    Map<String, String>? classSeat,
    Map<String, Map<String, bool>>? seats,
    int? countSeatsBussineesChoose,
    int? countSeatsEnconomyChoose,
    ChooseSeatStatus? chooseSeatStatus,
  }) {
    return ChooseSeatState(
      chooseSeat: chooseSeat ?? this.chooseSeat,
      classSeat: classSeat ?? this.classSeat,
      seats: seats ?? this.seats,
      countSeatsBussineesChoose: countSeatsBussineesChoose ?? this.countSeatsBussineesChoose,
      countSeatsEnconomyChoose: countSeatsEnconomyChoose ?? this.countSeatsEnconomyChoose,
      chooseSeatStatus: chooseSeatStatus ?? this.chooseSeatStatus,
    );
  }
}
