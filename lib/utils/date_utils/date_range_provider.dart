import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_range_provider.g.dart';

@Riverpod(keepAlive: true)
DateRange getDateRange(GetDateRangeRef ref, TimePeriod period) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(const Duration(days: 1));
  final yesterday = today.subtract(const Duration(days: 1));

  switch (period) {
    case TimePeriod.today:
      return DateRange(today, tomorrow);
    case TimePeriod.yesterday:
      return DateRange(yesterday, today);
    case TimePeriod.thisWeek:
      final startOfWeek = getStartOfWeek(now);
      final endOfWeek = getEndOfWeek(now);
      return DateRange(startOfWeek, endOfWeek);
    case TimePeriod.previousWeek:
      final startOfPrevWeek =
          getStartOfWeek(now.subtract(const Duration(days: 7)));
      final endOfPrevWeek = getEndOfWeek(now.subtract(const Duration(days: 7)));
      return DateRange(startOfPrevWeek, endOfPrevWeek);
    case TimePeriod.thisMonth:
      final startOfMonth = getStartOfMonth(now);
      final endOfMonth = getEndOfMonth(now);
      return DateRange(startOfMonth, endOfMonth);
    case TimePeriod.previousMonth:
      final startOfPrevMonth =
          getStartOfMonth(now.subtract(Duration(days: now.day)));
      final endOfPrevMonth =
          getEndOfMonth(now.subtract(Duration(days: now.day)));
      return DateRange(startOfPrevMonth, endOfPrevMonth);
    case TimePeriod.thisYear:
      final startOfYear = DateTime(now.year);
      final endOfYear = DateTime(now.year, 12, 31);
      return DateRange(startOfYear, endOfYear);
    case TimePeriod.previousYear:
      final startOfPrevYear = DateTime(now.year - 1);
      final endOfPrevYear = DateTime(now.year - 1, 12, 31);
      return DateRange(startOfPrevYear, endOfPrevYear);
    case TimePeriod.sunday:
    case TimePeriod.monday:
    case TimePeriod.tuesday:
    case TimePeriod.wednesday:
    case TimePeriod.thursday:
    case TimePeriod.friday:
    case TimePeriod.saturday:
      final startOfWeek = getStartOfWeek(now);
      final endOfWeek = getEndOfWeek(now);
      final dayOfWeek = period.index;
      final startOfPeriod = startOfWeek.add(Duration(days: dayOfWeek));
      final endOfPeriod = endOfWeek.subtract(Duration(days: 7 - dayOfWeek));
      return DateRange(startOfPeriod, endOfPeriod);
  }
}

DateTime getStartOfWeek(DateTime dateTime) {
  final weekDay = dateTime.weekday;
  final daysUntilSunday = (weekDay - DateTime.sunday) % 7;
  final firstDayOfWeek = dateTime.subtract(Duration(days: daysUntilSunday));
  return DateTime(
      firstDayOfWeek.year, firstDayOfWeek.month, firstDayOfWeek.day);
}

DateTime getEndOfWeek(DateTime dateTime) {
  final weekDay = dateTime.weekday;
  final daysUntilSaturday = (DateTime.saturday - weekDay + 7) % 7;
  final lastDayOfWeek = dateTime.add(Duration(days: daysUntilSaturday + 1));
  return DateTime(
      lastDayOfWeek.year, lastDayOfWeek.month, lastDayOfWeek.day + 1);
}

DateTime getStartOfMonth(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, 1);
}

DateTime getEndOfMonth(DateTime dateTime) {
  final lastDayOfMonth = DateTime(dateTime.year, dateTime.month + 1, 1);
  return DateTime(
      lastDayOfMonth.year, lastDayOfMonth.month, lastDayOfMonth.day);
}
