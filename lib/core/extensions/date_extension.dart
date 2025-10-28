// =================== DateTime Extensions ===================
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  // =================== Formatlama ===================
  String toFormattedString({String pattern = 'yyyy-MM-dd HH:mm'}) =>
      DateFormat(pattern).format(this);

  String toDateOnlyString({String pattern = 'yyyy-MM-dd'}) =>
      DateFormat(pattern).format(this);

  String toTimeOnlyString({String pattern = 'HH:mm'}) =>
      DateFormat(pattern).format(this);

  // =================== Manipülasyon ===================
  DateTime addDays(int days) => add(Duration(days: days));
  DateTime addMonths(int months) => DateTime(
    year,
    month + months,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );
  DateTime addYears(int years) => DateTime(
    year + years,
    month,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );
  DateTime startOfDay() => DateTime(year, month, day);
  DateTime endOfDay() => DateTime(year, month, day, 23, 59, 59, 999);

  // =================== Kontroller ===================
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  bool get isWeekend => [DateTime.saturday, DateTime.sunday].contains(weekday);
  bool get isWeekday => !isWeekend;

  int daysBetween(DateTime other) => (difference(other).inHours / 24).round();
}
