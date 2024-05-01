part of 'hotel_bloc.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class GetHotelEvent extends HotelEvent {}

class SearchHotelEvent extends HotelEvent {
  const SearchHotelEvent({
    required this.textSearchHotel,
  });
  final String textSearchHotel;

  @override
  List<Object> get props => [textSearchHotel];
}

class FilterHotelWithPrice extends HotelEvent {
  const FilterHotelWithPrice({
    required this.typeFilter,
    this.priceStart,
    this.priceEnd,
  });
  final int? priceStart;
  final int? priceEnd;
  final TypeFilter typeFilter;

  @override
  List<Object> get props => [ typeFilter];
}

enum TypeFilter { choosePrice, sortPriceLowToHigh, sortPriceHighToLow }
