import 'package:equatable/equatable.dart';

class GuestFlightEntity extends Equatable{
  const GuestFlightEntity({
    required this.name,
    required this.seat,
    required this.classSeat,
  });
  final String name;
  final String seat;
  final String classSeat;

  @override
  List<Object?> get props => [name, seat, classSeat];
}
