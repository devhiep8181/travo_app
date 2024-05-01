part of 'promo_bloc.dart';

enum PromoStatus { initial, loading, loaded, success, error }

extension PromoSatusX on PromoStatus {
  bool get isLoaded => [PromoStatus.loaded].contains(this);
  bool get isSuccess => [PromoStatus.success].contains(this);
}

class PromoState extends Equatable {
  const PromoState({
    required this.listPromo,
    required this.promoStatus,
    required this.choosePromo,
    required this.message,
  });
  final List<PromoEntity> listPromo;
  final PromoStatus promoStatus;
  final PromoEntity choosePromo;
  final String message;

  @override
  List<Object> get props => [listPromo, promoStatus, choosePromo, message];

  PromoState copyWith({
    List<PromoEntity>? listPromo,
    PromoStatus? promoStatus,
    PromoEntity? choosePromo,
    String? message,
  }) {
    return PromoState(
      listPromo: listPromo ?? this.listPromo,
      promoStatus: promoStatus ?? this.promoStatus,
      choosePromo: choosePromo ?? this.choosePromo,
      message: message ?? this.message,
    );
  }
}
