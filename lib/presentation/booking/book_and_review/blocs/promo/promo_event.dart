part of 'promo_bloc.dart';

abstract class PromoEvent extends Equatable {
  const PromoEvent();

  @override
  List<Object> get props => [];
}

class GetPromoEvent extends PromoEvent {}

class ChoosePromoEvent extends PromoEvent {
  const ChoosePromoEvent({
    required this.choosePromo,
  });
  final PromoEntity choosePromo;
  
  @override
  List<Object> get props => [choosePromo];
}
