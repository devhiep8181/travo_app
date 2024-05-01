import '../../presentation/booking/book_and_review/blocs/choose_date/choose_date_data.dart';

class DateTimeFormat {
  static String dateTimeFormatFlight(DateTime date) {
    return '${date.day}, ${monthData[date.month.toString().padLeft(2, '0')]} ${date.year}';
  }

  static String dateTimeFormatRoom(String day, String month, String year) {
    return '$day, $month $year';
  }
}
