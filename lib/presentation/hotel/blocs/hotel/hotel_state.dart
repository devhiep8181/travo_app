part of 'hotel_bloc.dart';

abstract class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  const HotelLoaded({required this.listHotel});

  final List<HotelEntity> listHotel;
  @override
  List<Object> get props => [listHotel];
}

class HotelError extends HotelState {
  const HotelError({
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [message];
}

class NotFoundHotel extends HotelState{
  
}
