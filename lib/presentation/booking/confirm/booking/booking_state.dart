part of 'booking_bloc.dart';

enum BookingStatus { initial, loading, loaded, success, error }

extension BookingStatusX on BookingStatus {
  bool get isLoaded => [
        BookingStatus.loaded,
      ].contains(this);

  bool get isLoading => [BookingStatus.loading].contains(this);
  bool get isError => [BookingStatus.error].contains(this);
  bool get isSuccess => [BookingStatus.success].contains(this);
}

class BookingState extends Equatable {
  const BookingState(
      {required this.bookinglist,
      required this.bookingStatus,
      required this.message});
  final List<BookingEntity> bookinglist;
  final BookingStatus bookingStatus;
  final String message;

  @override
  List<Object> get props => [bookinglist, bookingStatus, message];

  BookingState copyWith({
    List<BookingEntity>? bookinglist,
    BookingStatus? bookingStatus,
    String? message,
  }) {
    return BookingState(
      bookinglist: bookinglist ?? this.bookinglist,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      message: message ?? this.message,
    );
  }
}
