import 'package:ecopocket_clean_architecture/features/budget/domain/model/category_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/module.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/repository/transactions_repository.dart';

part 'category_info_service.g.dart';

class CategoryInfoService {
  CategoryInfoService({required this.transactionsRepository});
  final TransactionsRepository transactionsRepository;
}

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
  // ignore: unused_local_variable
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
  return repo.getTodaysCategoriesInfo();
}

@riverpod
Future<CategoryInfoList> getYesterdaysCategoriesInfoList(
    GetYesterdaysCategoriesInfoListRef ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  return repo.getYesterdayCategoriesInfo();
}

@Riverpod(keepAlive: true)
Future<double> getSpendings(GetSpendingsRef ref,
    {required DateRange range}) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  return repo.getSpendings(range);
}

@riverpod
Future<TransactionList> getCategoryTransactions(GetCategoryTransactionsRef ref,
    {required DateRange range, required int categoryId}) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  return repo.getCategoryTransactions(range, categoryId);
}

@riverpod
Future<CategoryList> getCategories(GetCategoriesRef ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  return repo.getCategoryList();
}
