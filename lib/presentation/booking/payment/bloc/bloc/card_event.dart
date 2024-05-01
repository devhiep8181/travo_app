part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class GetCardEvent extends CardEvent {
  const GetCardEvent({
    required this.name,
    required this.cardNumber,
    required this.expDate,
    required this.cVV,
    required this.countryName,
  });
  final String name;
  final String cardNumber;
  final String expDate;
  final String cVV;
  final String countryName;

  @override
  List<Object> get props => [name, cardNumber, expDate, cVV, countryName];
}
