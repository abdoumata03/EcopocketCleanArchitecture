import 'package:ecopocket_clean_architecture/features/budget/data/entity/category_entity.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';

abstract class BudgetDatabase {
  Future<void> updateBudget(CategoryEntity categoryEntity);
  Future<dynamic> categorySpending(int categoryId, DateRange dateRange);
  Future<void> resetBudget();
}
