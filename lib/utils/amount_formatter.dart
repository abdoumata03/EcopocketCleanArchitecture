import "package:intl/intl.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part 'amount_formatter.g.dart';

@riverpod
NumberFormat amountFormatter(AmountFormatterRef ref) {
  return NumberFormat("#,##0", "en_US");
}
