import 'package:ecopocket_clean_architecture/features/budget/domain/model/category_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction_list.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';

abstract class TransactionsRepository {
  Future<TransactionList> getTransactionList();
  Future<TransactionList> getTransactionListByDateRange(DateRange dateRange);
  Future<Transaction> createTransaction(
    final double amount,
    final String type,
    final int? category,
    final String? wallet,
    final String description,
    final DateTime createdTime,
  );
  Future<void> updateTransaction(
    final int id,
    final double amount,
    final String type,
    final int? category,
    final String? wallet,
    final String description,
    final DateTime createdTime,
  );
  Future<void> deleteTransaction(final int id);
  Future<CategoryInfoList> getTodaysCategoriesInfo();
  Future<CategoryInfoList> getYesterdayCategoriesInfo();
  Future<CategoryList> getCategoryList();
  Future<double> getSpendings(final DateRange dateRange);
  Future<TransactionList> getCategoryTransactions(
      DateRange dateRange, int categotyId);
}
