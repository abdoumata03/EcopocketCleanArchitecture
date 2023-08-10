import 'package:ecopocket_clean_architecture/features/budget/data/datasource/budget_database.dart';
import 'package:ecopocket_clean_architecture/features/budget/data/entity/category_entity.dart';
import 'package:ecopocket_clean_architecture/features/budget/data/mapper/category_mapper.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/repository/budget_repository.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';

class BudgetRepositoryImplementation implements BudgetRepository {
  final BudgetDatabase database;
  BudgetRepositoryImplementation(this.database);

  @override
  Future<void> updateBudget(Category category) async {
    final CategoryEntity categoryEntity = CategoryMapper.toMap(category);
    await database.updateBudget(categoryEntity);
  }

  @override
  Future<double> categorySpending(int categoryId, DateRange dateRange) async {
    final amount = await database.categorySpending(categoryId, dateRange);
    var total = amount.first['total'];
    if (total == null) {
      return 0;
    }
    return total.toDouble();
  }

  @override
  Future<void> resetBudget() async {
    await database.resetBudget();
  }
}
