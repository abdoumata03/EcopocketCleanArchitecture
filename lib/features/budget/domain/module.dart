import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ecopocket_clean_architecture/features/budget/data/module.dart';
import 'package:ecopocket_clean_architecture/features/budget/data/repository/budget_repository_impl.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/repository/budget_repository.dart';

part 'module.g.dart';

@Riverpod(keepAlive: true)
BudgetRepository budgetRepository(BudgetRepositoryRef ref) {
  final budgetDatabase = ref.watch(budgetDatabaseProvider);
  return BudgetRepositoryImplementation(budgetDatabase);
}

@riverpod
Future<double> categorySpending(CategorySpendingRef ref,
    {required int categoryId, required DateRange dateRange}) async {
  final repo = ref.watch(budgetRepositoryProvider);
  final spending = await repo.categorySpending(categoryId, dateRange);
  return spending;
}
