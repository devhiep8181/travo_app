part of 'choose_card_bloc.dart';

enum ChooseCardStatus { initial, loading, loaded, errror }

extension ChooseCardStatusX on ChooseCardStatus {
  bool get isLoaded => [ChooseCardStatus.loaded].contains(this);
  bool get isError => [ChooseCardStatus.errror].contains(this);
  bool get isLoading => [ChooseCardStatus.loading].contains(this);
}

class ChooseCardState extends Equatable {
  const ChooseCardState({
    required this.imagePath,
    required this.titlePayment,
    required this.chooseCardStatus,
    required this.chooseCard,
  });
  final String imagePath;
  final String titlePayment;
  final ChooseCardStatus chooseCardStatus;
  final Map<String, bool> chooseCard;
  @override
  List<Object> get props =>
      [imagePath, titlePayment, chooseCardStatus, chooseCard];

  ChooseCardState copyWith({
    String? imagePath,
    String? titlePayment,
    ChooseCardStatus? chooseCardStatus,
    Map<String, bool>? chooseCard,
  }) {
    return ChooseCardState(
      imagePath: imagePath ?? this.imagePath,
      titlePayment: titlePayment ?? this.titlePayment,
      chooseCardStatus: chooseCardStatus ?? this.chooseCardStatus,
      chooseCard: chooseCard ?? this.chooseCard,
    );
  }
}
