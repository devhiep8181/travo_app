part of 'choose_card_bloc.dart';

abstract class ChooseCardEvent extends Equatable {
  const ChooseCardEvent();

  @override
  List<Object> get props => [];
}

class ImportCardEvent extends ChooseCardEvent {
  const ImportCardEvent({
    required this.imagePath,
    required this.titlePayment,
  });
  final String imagePath;
  final String titlePayment;

  @override
  List<Object> get props => [imagePath, titlePayment];
}
