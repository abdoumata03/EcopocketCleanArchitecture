import 'package:intl/intl.dart';

String getTodaysDate() {
  var today = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(today);
}

String getYesterdaysDate() {
  var yesterday = DateTime.now().subtract(const Duration(days: 1));
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(yesterday);
}
