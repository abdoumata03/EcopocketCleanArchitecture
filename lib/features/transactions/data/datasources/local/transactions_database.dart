import 'package:ecopocket_clean_architecture/features/budget/data/entity/category_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/transactions_database_impl.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/entity/category_info_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/entity/transactions_entity.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_database.g.dart';

abstract class TransactionsDatabase {
  Future<TransactionListEntity> allTransactions();
  Future<TransactionEntity> addTransaction(
      final TransactionEntity transactionEntity);
  Future<void> updateTransaction(final TransactionEntity transactionEntity);
  Future<void> deleteTransaction(final int id);
  Future<CategoryInfoListEntity> getTodayCategoryInfo();
  Future<CategoryInfoListEntity> getYstdCategoryInfo();
  Future<CategoryListEntity> allCategories();
  Future<dynamic> getSpendings(DateRange dateRange);
  Future<TransactionListEntity> getCategoryTransactions(
      DateRange dateRange, int categoryId);
}

@riverpod
TransactionsDatabase transactionsDatabase(TransactionsDatabaseRef ref) {
  return TransactionsDatabaseImplemention();
}
