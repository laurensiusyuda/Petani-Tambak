import 'package:intl/intl.dart';

class DatetimeHelper {
  static DateTime dateTimeScheduled() {
    final now = DateTime.now();
    final timeFormat = DateFormat('H:m:s');
    final todayTime = timeFormat.format(now);
    final resultToday = timeFormat.parseStrict(todayTime);
    return resultToday;
  }
}
