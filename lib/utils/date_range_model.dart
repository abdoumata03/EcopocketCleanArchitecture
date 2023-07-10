import 'package:intl/intl.dart';

class DateRange {
  final DateTime start;
  final DateTime end;

  String get startDate =>
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS").format(start);
  String get endDate => DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS").format(end);
  DateRange(this.start, this.end);
}
