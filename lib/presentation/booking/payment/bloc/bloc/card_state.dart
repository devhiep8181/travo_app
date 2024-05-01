part of 'card_bloc.dart';

enum CardStatus { initial, loading, loaded, error }

extension CardStatusX on CardStatus {
  bool get isLoading => [CardStatus.loading].contains(this);
  bool get isLoaded => [CardStatus.loaded].contains(this);
}

class CardState extends Equatable {
  const CardState(
      {required this.cVV,
      required this.cardNumber,
      required this.cardStatus,
      required this.countryName,
      required this.expDate,
      required this.name});
  final String name;
  final String cardNumber;
  final String expDate;
  final String cVV;
  final String countryName;
  final CardStatus cardStatus;

  @override
  List<Object> get props =>
      [name, cardNumber, expDate, cVV, countryName, cardStatus];

  CardState copyWith({
    String? name,
    String? cardNumber,
    String? expDate,
    String? cVV,
    String? countryName,
    CardStatus? cardStatus,
  }) {
    return CardState(
      name: name ?? this.name,
      cardNumber: cardNumber ?? this.cardNumber,
      expDate: expDate ?? this.expDate,
      cVV: cVV ?? this.cVV,
      countryName: countryName ?? this.countryName,
      cardStatus: cardStatus ?? this.cardStatus,
    );
  }
}

// class CardInitial extends CardState {}

// class CardLoaded extends CardState {
//   const CardLoaded({
//     required this.name,
//     required this.cardNumber,
//     required this.expDate,
//     required this.cVV,
//     required this.countryName,
//   });
//   final String name;
//   final String cardNumber;
//   final String expDate;
//   final String cVV;
//   final String countryName;

//   @override
//   List<Object> get props => [name, cardNumber, expDate, cVV, countryName];
// }

// class CardError extends CardState {
//   const CardError({
//     required this.message,
//   });
//   final String message;

//   @override
//   List<Object> get props => [message];
// }
