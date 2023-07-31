import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';

abstract class BudgetRepository {
  Future<void> updateBudget(Category category);
  Future<double> categorySpending(int categoryId, DateRange dateRange);
}
