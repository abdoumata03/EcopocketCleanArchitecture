class CategoryBudgetException implements Exception {
  final String message = "Category budget exceeded";
  @override
  String toString() {
    return message;
  }
}

class MonthlyBudgetExpection implements Exception {
  final String message = "Monthly budget exceeded";
  @override
  String toString() {
    return message;
  }
}
