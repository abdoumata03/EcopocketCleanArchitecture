import 'package:ecopocket_clean_architecture/features/budget/domain/model/category_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/module.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';

part 'home_providers.g.dart';

@riverpod
Future<double> todaysTotal(TodaysTotalRef ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final todaysCategories = await repo.getTodaysCategoriesInfo();
  // ignore: unused_local_variable
  double totalAmount = 0;
  for (final category in todaysCategories.categoryInfoList) {
    totalAmount += category.total;
  }

  return totalAmount;
}

@riverpod
Future<double> yesterdaysTotal(YesterdaysTotalRef ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final ystdCategories = await repo.getYesterdayCategoriesInfo();
  double totalAmount = 0;
  for (final category in ystdCategories.categoryInfoList) {
    totalAmount += category.total;
  }

  return totalAmount;
}

@riverpod
Future<CategoryInfoList> getTodaysCategoriesInfoList(
    GetTodaysCategoriesInfoListRef ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final todaysCategories = await repo.getTodaysCategoriesInfo();
  return todaysCategories;
}

@riverpod
Future<CategoryInfoList> getYesterdaysCategoriesInfoList(
    GetYesterdaysCategoriesInfoListRef ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final ystdCategories = await repo.getYesterdayCategoriesInfo();
  return ystdCategories;
}

@Riverpod(keepAlive: true)
Future<double> getSpendings(GetSpendingsRef ref,
    {required DateRange range}) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final spendings = await repo.getSpendings(range);
  return spendings;
}

@riverpod
Future<TransactionList> getCategoryTransactions(GetCategoryTransactionsRef ref,
    {required DateRange range, required int categoryId}) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final transactions = await repo.getCategoryTransactions(range, categoryId);
  return transactions;
}

@riverpod
Future<CategoryList> getCategories(GetCategoriesRef ref,
    [CategoryType? categoryType]) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final categories = await repo.getCategoryList();
  switch (categoryType) {
    case CategoryType.budget:
      return categories.haveBudgetCategories;
    case CategoryType.noBudget:
      return categories.noBudgetCategories;
    default:
      return categories;
  }
}

enum CategoryType { budget, noBudget }
