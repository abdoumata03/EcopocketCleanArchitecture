import 'package:ecopocket_clean_architecture/features/budget/data/mapper/category_list_mapper.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/model/category_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/transactions_database.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/mapper/category_info_list_mapper.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/mapper/transaction_list_mapper.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/mapper/transaction_mapper.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/repository/transactions_repository.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_model.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsDatabase database;

  TransactionsRepositoryImpl(this.database);

  @override
  Future<Transaction> createTransaction(
      double amount,
      String type,
      int? category,
      String? wallet,
      String description,
      DateTime createdTime) async {
    final transactionEntity = await database.addTransaction(
        TransactionMapper.toNewEntityMap(
            amount, type, category, wallet, description, createdTime));
    return TransactionMapper.toModel(transactionEntity);
  }

  @override
  Future<TransactionList> getTransactionList() async {
    final transactionListEntity = await database.allTransactions();
    return TransactionListMapper.toModel(transactionListEntity);
  }

  @override
  Future<void> updateTransaction(
      int id,
      double amount,
      String type,
      int? category,
      String? wallet,
      String description,
      DateTime createdTime) async {
    final transaction = Transaction(
        id: id,
        amount: amount,
        type: type,
        category: category,
        wallet: wallet,
        description: description,
        createdTime: createdTime);
    await database.updateTransaction(TransactionMapper.toMap(transaction));
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await database.deleteTransaction(id);
  }

  @override
  Future<CategoryInfoList> getTodaysCategoriesInfo() async {
    final categoryInfoListEntity = await database.getTodayCategoryInfo();
    return CategoryInfoListMapper.toModel(categoryInfoListEntity);
  }

  @override
  Future<CategoryInfoList> getYesterdayCategoriesInfo() async {
    final categoryInfoListEntity = await database.getYstdCategoryInfo();
    return CategoryInfoListMapper.toModel(categoryInfoListEntity);
  }

  @override
  Future<CategoryList> getCategoryList() async {
    final categoryList = await database.allCategories();
    return CategoryListMapper.toModel(categoryList);
  }

  @override
  Future<double> getSpendings(DateRange dateRange) async {
    final amount = await database.getSpendings(dateRange);
    return amount.first['total'].toDouble();
  }

  @override
  Future<TransactionList> getCategoryTransactions(
      DateRange dateRange, int categoryId) async {
    final transactionList =
        await database.getCategoryTransactions(dateRange, categoryId);
    return TransactionListMapper.toModel(transactionList);
  }
}
