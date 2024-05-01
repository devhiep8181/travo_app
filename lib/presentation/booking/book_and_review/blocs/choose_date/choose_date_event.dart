part of 'choose_date_bloc.dart';

abstract class ChooseDateEvent extends Equatable {
  const ChooseDateEvent();

  @override
  List<Object> get props => [];
}

class ProcessDateEvent extends ChooseDateEvent {
  const ProcessDateEvent({
    required this.dayStart,
    required this.dayEnd,
    required this.monthStart,
    required this.monthEnd,
    required this.yearStart,
    required this.yearEnd,
  });
  final String dayStart;
  final String dayEnd;
  final String monthStart;
  final String monthEnd;
  final String yearStart;
  final String yearEnd;

  @override
  List<Object> get props =>
      [dayStart, dayEnd, monthStart, monthEnd, yearEnd, yearStart];
}
