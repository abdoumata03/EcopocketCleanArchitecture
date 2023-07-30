import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'percentage_calculator.g.dart';

@riverpod
double calculatePercentage(CalculatePercentageRef ref,
    {required double total, required double amount}) {
  final percentage = amount / total * 100;
  if (percentage.isNaN) return 0;
  if (percentage > 100) return 100;
  return percentage;
}
