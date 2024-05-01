part of 'choose_date_bloc.dart';

enum ChooseDateStatus { initial, loaded, error }

extension ChooseDateStatusX on ChooseDateStatus {
  bool get isLoaded => [ChooseDateStatus.loaded].contains(this);
}

class ChooseDateState extends Equatable {
  const ChooseDateState(
      {required this.dayStart,
      required this.dayEnd,
      required this.chooseDateStatus,
      required this.monthEnd,
      required this.monthStart,
      required this.yearEnd,
      required this.yearStart});
  final String dayStart;
  final String dayEnd;
  final String monthStart;
  final String monthEnd;
  final String yearStart;
  final String yearEnd;
  final ChooseDateStatus chooseDateStatus;
  @override
  List<Object> get props =>
      [dayEnd, dayStart, monthEnd, monthStart, yearStart, yearEnd];

  ChooseDateState copyWith({
    String? dayStart,
    String? dayEnd,
    String? monthStart,
    String? monthEnd,
    String? yearStart,
    String? yearEnd,
    ChooseDateStatus? chooseDateStatus,
  }) {
    return ChooseDateState(
      dayStart: dayStart ?? this.dayStart,
      dayEnd: dayEnd ?? this.dayEnd,
      monthStart: monthStart ?? this.monthStart,
      monthEnd: monthEnd ?? this.monthEnd,
      yearStart: yearStart ?? this.yearStart,
      yearEnd: yearEnd ?? this.yearEnd,
      chooseDateStatus: chooseDateStatus ?? this.chooseDateStatus,
    );
  }
}
